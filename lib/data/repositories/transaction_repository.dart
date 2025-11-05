import 'package:asverta/data/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class TransactionRepository {
  final AppDatabase _database;
  TransactionRepository(this._database);

  Stream<List<TransactionWithCustomer>> watchAllTransactions() {
    return _database.watchAllTransactionsWithCustomer();
  }

  Stream<List<PaymentData>> watchPaymentsForTransaction(String transactionId) {
    return _database.watchPaymentsForTransaction(transactionId);
  }
  
  Future<TransactionFullDetails> getFullTransactionDetails(String transactionId) {
    return _database.getFullTransactionDetails(transactionId);
  }

  Future<DashboardStats> getDashboardStats() {
    return _database.getDashboardStats();
  }

  Stream<List<TransactionWithCustomer>> watchTransactionsByDateRange(DateTime start, DateTime end) {
    return _database.watchTransactionsByDateRange(start, end);
  }

  Stream<List<TransactionWithCustomer>> watchTransactionsByStatus(List<String> statuses) {
    return _database.watchTransactionsByStatus(statuses);
  }

  Future<void> createCreditTransaction({
    required String customerId,
    required String userId,
    required List<TransactionItemsCompanion> items,
    required double subtotal,
    required double downPayment,
    required String downPaymentMethod,
    required double remainingAmount,
    required int tenor,
    required double interestRate,
    required double interestAmount,
    required double adminFee,
    required double monthlyInstallment,
    required double totalPayable,
    required DateTime firstPaymentDate,
    required DateTime nextPaymentDue,
  }) async {
    
    final transactionId = uuid.v4();
    final transactionNumber = 'INV-${DateTime.now().millisecondsSinceEpoch}';

    final transactionData = TransactionsCompanion.insert(
      id: transactionId,
      transactionNumber: transactionNumber,
      customerId: customerId,
      userId: userId,
      type: const Value('credit'),
      subtotal: subtotal,
      downPayment: Value(downPayment),
      downPaymentMethod: Value(downPaymentMethod),
      remainingAmount: remainingAmount,
      tenor: Value(tenor),
      interestRate: Value(interestRate),
      interestAmount: Value(interestAmount),
      adminFee: Value(adminFee),
      monthlyInstallment: monthlyInstallment,
      totalPayable: totalPayable,
      totalPaid: Value(downPayment),
      remainingDebt: totalPayable - downPayment,
      paidInstallments: Value(downPayment > 0 ? 1 : 0),
      remainingInstallments: tenor - (downPayment > 0 ? 1 : 0),
      status: const Value('active'),
      firstPaymentDate: Value(firstPaymentDate),
      nextPaymentDue: Value(nextPaymentDue),
      transactionDate: Value(DateTime.now()),
    );
    
    await _database.transaction(() async {
      await _database.into(_database.transactions).insert(transactionData);

      if (downPayment > 0) {
        await _database.into(_database.payments).insert(
          PaymentsCompanion.insert(
            id: uuid.v4(),
            paymentNumber: 'DP-$transactionNumber',
            transactionId: transactionId,
            customerId: customerId,
            userId: userId,
            amount: downPayment,
            paymentMethod: downPaymentMethod,
            installmentNumber: 0,
            paymentType: const Value('down_payment'),
            paymentDate: Value(DateTime.now()),
          ),
        );
      }

      for (final item in items) {
        await _database.into(_database.transactionItems).insert(
          item.copyWith(
            id: Value(uuid.v4()),
            transactionId: Value(transactionId),
          ),
        );
        
        await (_database.update(_database.products)..where((p) => p.id.equals(item.productId.value)))
          .write(
            ProductsCompanion(
              stock: Value(item.quantity.value * -1),
            )
          );
      }

      final customer = await _database.getCustomerById(customerId);
      if (customer != null) {
        final newTotalDebt = customer.totalDebt + (totalPayable - downPayment);
        await (_database.update(_database.customers)..where((c) => c.id.equals(customerId)))
          .write(
            CustomersCompanion(
              totalDebt: Value(newTotalDebt),
              lastTransactionDate: Value(DateTime.now()),
            )
          );
      }
    });
  }

  Future<void> createPayment({
    required String transactionId,
    required String customerId,
    required String userId,
    required double amount,
    required String paymentMethod,
    required int installmentNumber,
    required String notes,
  }) async {
    
    final transaction = await _database.getFullTransactionDetails(transactionId);
    if (transaction.transaction.status == 'completed') {
      throw Exception('Transaksi ini sudah lunas');
    }

    final paymentId = uuid.v4();
    final paymentNumber = 'PAY-${DateTime.now().millisecondsSinceEpoch}';

    await _database.transaction(() async {
      await _database.into(_database.payments).insert(
        PaymentsCompanion.insert(
          id: paymentId,
          paymentNumber: paymentNumber,
          transactionId: transactionId,
          customerId: customerId,
          userId: userId,
          amount: amount,
          paymentMethod: paymentMethod,
          installmentNumber: installmentNumber,
          paymentType: const Value('installment'),
          notes: Value(notes),
          paymentDate: Value(DateTime.now()),
        ),
      );

      final newTotalPaid = transaction.transaction.totalPaid + amount;
      final newRemainingDebt = transaction.transaction.totalPayable - newTotalPaid;
      final newPaidInstallments = transaction.transaction.paidInstallments + 1;
      final isCompleted = newRemainingDebt <= 0 || newPaidInstallments == transaction.transaction.tenor;

      final nextPaymentDate = (transaction.transaction.nextPaymentDue != null && !isCompleted)
        ? DateTime(
            transaction.transaction.nextPaymentDue!.year,
            transaction.transaction.nextPaymentDue!.month + 1,
            transaction.transaction.nextPaymentDue!.day,
          )
        : null;

      await (_database.update(_database.transactions)..where((t) => t.id.equals(transactionId)))
        .write(
          TransactionsCompanion(
            totalPaid: Value(newTotalPaid),
            remainingDebt: Value(newRemainingDebt < 0 ? 0 : newRemainingDebt),
            paidInstallments: Value(newPaidInstallments),
            remainingInstallments: Value(transaction.transaction.tenor - newPaidInstallments),
            status: Value(isCompleted ? 'completed' : 'active'),
            lastPaymentDate: Value(DateTime.now()),
            nextPaymentDue: Value(nextPaymentDate),
          ),
        );

      await (_database.update(_database.customers)..where((c) => c.id.equals(customerId)))
        .write(
          CustomersCompanion(
            totalDebt: Value(transaction.customer.totalDebt - amount),
          ),
        );
    });
  }
}