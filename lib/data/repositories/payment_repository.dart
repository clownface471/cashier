import 'package:drift/drift.dart';
import '../database/app_database.dart';

/// Repository for Payment and Installment operations
class PaymentRepository {
  final AppDatabase _database;

  PaymentRepository(this._database);

  /// Get all payments for a specific transaction
  Stream<List<PaymentData>> watchPaymentsByTransaction(String transactionId) {
    return (_database.select(_database.payments)
          ..where((p) => p.transactionId.equals(transactionId))
          ..orderBy([(p) => OrderingTerm.asc(p.installmentNumber)]))
        .watch();
  }

  Future<List<PaymentData>> getPaymentsByTransaction(String transactionId) {
    return _database.getPaymentsByTransaction(transactionId);
  }

  /// Record a new installment payment
  /// This is the core "Mesin Pembayaran Cicilan" function
  Future<void> recordInstallmentPayment({
    required String transactionId,
    required String customerId,
    required String userId,
    required double amount,
    required String paymentMethod,
    required int installmentNumber,
    String? notes,
    String? paymentProof,
    String? referenceNumber,
  }) async {
    await _database.transaction(() async {
      // 1. Get current transaction data
      final transaction = await _database.getTransactionById(transactionId);
      if (transaction == null) {
        throw Exception('Transaksi tidak ditemukan');
      }

      // 2. Validate payment amount
      if (amount <= 0) {
        throw Exception('Jumlah pembayaran harus lebih dari 0');
      }

      if (amount > transaction.remainingDebt) {
        throw Exception('Jumlah pembayaran melebihi sisa hutang');
      }

      // 3. Insert payment record
      final paymentData = PaymentsCompanion(
        id: Value(uuid.v4()),
        paymentNumber: Value('PAY-${DateTime.now().millisecondsSinceEpoch}'),
        transactionId: Value(transactionId),
        customerId: Value(customerId),
        userId: Value(userId),
        amount: Value(amount),
        paymentMethod: Value(paymentMethod),
        installmentNumber: Value(installmentNumber),
        paymentType: const Value('installment'),
        status: const Value('completed'),
        notes: Value(notes),
        paymentProof: Value(paymentProof),
        referenceNumber: Value(referenceNumber),
        paymentDate: Value(DateTime.now()),
      );

      await _database.insertPayment(paymentData);

      // 4. Update transaction totals
      final newTotalPaid = transaction.totalPaid + amount;
      final newRemainingDebt = transaction.remainingDebt - amount;
      final newPaidInstallments = transaction.paidInstallments + 1;
      final newRemainingInstallments = transaction.remainingInstallments - 1;

      // 5. Determine new status
      String newStatus = transaction.status;
      if (newRemainingDebt <= 0 || newRemainingInstallments <= 0) {
        newStatus = 'completed'; // Lunas
      } else {
        newStatus = 'active';
      }

      // 6. Calculate next payment due date (30 days from now)
      DateTime? nextPaymentDue;
      if (newStatus != 'completed') {
        nextPaymentDue = DateTime.now().add(const Duration(days: 30));
      }

      // 7. Update transaction
      await _database.updateTransaction(
        TransactionsCompanion(
          id: Value(transactionId),
          totalPaid: Value(newTotalPaid),
          remainingDebt: Value(newRemainingDebt),
          paidInstallments: Value(newPaidInstallments),
          remainingInstallments: Value(newRemainingInstallments),
          status: Value(newStatus),
          lastPaymentDate: Value(DateTime.now()),
          nextPaymentDue: Value(nextPaymentDue),
          updatedAt: Value(DateTime.now()),
        ),
      );

      // 8. Update customer's total debt
      final customer = await _database.getCustomerById(customerId);
      if (customer != null) {
        final newCustomerDebt = customer.totalDebt - amount;
        await _database.updateCustomerDebt(customerId, newCustomerDebt);
      }
    });
  }

  /// Get payment summary for a transaction
  Future<Map<String, dynamic>> getPaymentSummary(String transactionId) async {
    final transaction = await _database.getTransactionById(transactionId);
    final payments = await getPaymentsByTransaction(transactionId);

    if (transaction == null) {
      return {};
    }

    return {
      'totalPayable': transaction.totalPayable,
      'totalPaid': transaction.totalPaid,
      'remainingDebt': transaction.remainingDebt,
      'paidInstallments': transaction.paidInstallments,
      'remainingInstallments': transaction.remainingInstallments,
      'monthlyInstallment': transaction.monthlyInstallment,
      'paymentsCount': payments.length,
      'status': transaction.status,
      'nextPaymentDue': transaction.nextPaymentDue,
    };
  }

  /// Get overdue transactions (jatuh tempo terlewat)
  Future<List<TransactionData>> getOverdueTransactions() async {
    final now = DateTime.now();
    final activeTransactions = await _database.getActiveTransactions();

    return activeTransactions.where((tx) {
      if (tx.nextPaymentDue == null) return false;
      return tx.nextPaymentDue!.isBefore(now);
    }).toList();
  }

  /// Cancel a payment (if needed)
  Future<void> cancelPayment(String paymentId) async {
    await _database.transaction(() async {
      final payment = await (_database.select(_database.payments)
            ..where((p) => p.id.equals(paymentId)))
          .getSingleOrNull();

      if (payment == null) {
        throw Exception('Pembayaran tidak ditemukan');
      }

      if (payment.status == 'cancelled') {
        throw Exception('Pembayaran sudah dibatalkan');
      }

      // Reverse the payment effects
      final transaction = await _database.getTransactionById(payment.transactionId);
      if (transaction != null) {
        final newTotalPaid = transaction.totalPaid - payment.amount;
        final newRemainingDebt = transaction.remainingDebt + payment.amount;
        final newPaidInstallments = transaction.paidInstallments - 1;
        final newRemainingInstallments = transaction.remainingInstallments + 1;

        await _database.updateTransaction(
          TransactionsCompanion(
            id: Value(transaction.id),
            totalPaid: Value(newTotalPaid),
            remainingDebt: Value(newRemainingDebt),
            paidInstallments: Value(newPaidInstallments),
            remainingInstallments: Value(newRemainingInstallments),
            status: const Value('active'), // Back to active
            updatedAt: Value(DateTime.now()),
          ),
        );

        // Update customer debt
        final customer = await _database.getCustomerById(transaction.customerId);
        if (customer != null) {
          final newCustomerDebt = customer.totalDebt + payment.amount;
          await _database.updateCustomerDebt(transaction.customerId, newCustomerDebt);
        }
      }

      // Mark payment as cancelled
      await (_database.update(_database.payments)
            ..where((p) => p.id.equals(paymentId)))
          .write(const PaymentsCompanion(
        status: Value('cancelled'),
      ));
    });
  }
}