import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

// Import all table definitions
import 'tables/products_table.dart';
import 'tables/customers_table.dart';
import 'tables/transactions_table.dart';
import 'tables/payments_table.dart';
import 'tables/other_tables.dart';

// Import model kustom BARU
import 'package:asverta/data/models/transaction_models.dart';

part 'app_database.g.dart';

// UUID generator instance
const uuid = Uuid();

// ==== Data class untuk hasil JOIN ====
class TransactionWithCustomer {
  final TransactionData transaction;
  final CustomerData customer;

  TransactionWithCustomer(this.transaction, this.customer);
}

/// Main Database Class using Drift
@DriftDatabase(tables: [
  Products,
  Categories,
  Customers,
  Transactions,
  TransactionItems,
  Payments,
  Users,
  Expenses,
  StoreSettings,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        
        // Insert default store settings
        await into(storeSettings).insert(
          StoreSettingsCompanion.insert(
            id: const Value(1),
            storeName: const Value('Toko Saya'),
            currencySymbol: const Value('Rp'),
            defaultInterestRate: const Value(2.0),
            useStock: const Value(true),
          ),
        );

        // Insert default admin user (Owner)
        await into(users).insert(
          UsersCompanion.insert(
            id: uuid.v4(),
            username: 'admin',
            password: 'admin123', // TODO: Hash this with bcrypt
            fullName: 'Administrator',
            role: const Value('owner'),
            isActive: const Value(true),
          ),
        );
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle future schema upgrades here
      },
    );
  }

  // ==================== PRODUCTS ====================
  // (Kode CRUD Produk Anda yang ada tetap di sini... tidak berubah)
  Future<List<ProductData>> getAllProducts() => select(products).get();
  Future<List<ProductData>> getActiveProducts() {
    return (select(products)..where((p) => p.isActive.equals(true))).get();
  }
  Future<ProductData?> getProductById(String id) {
    return (select(products)..where((p) => p.id.equals(id))).getSingleOrNull();
  }
  Future<int> insertProduct(ProductsCompanion product) {
    final productWithId = product.id == const Value.absent()
        ? product.copyWith(id: Value(uuid.v4()))
        : product;
    return into(products).insert(productWithId);
  }
  Future<bool> updateProduct(ProductsCompanion product) {
    return update(products).replace(product);
  }
  Future<int> deleteProduct(String id) {
    return (delete(products)..where((p) => p.id.equals(id))).go();
  }
  Future<int> updateProductStock(String productId, int newStock) {
    return (update(products)..where((p) => p.id.equals(productId)))
        .write(ProductsCompanion(
          stock: Value(newStock),
          updatedAt: Value(DateTime.now()),
        ));
  }
  
  // ==================== CATEGORIES ====================
  // (Kode Kategori Anda tetap di sini... tidak berubah)
  Future<List<CategoryData>> getAllCategories() => select(categories).get();
  Future<int> insertCategory(CategoriesCompanion category) {
    final categoryWithId = category.id == const Value.absent()
        ? category.copyWith(id: Value(uuid.v4()))
        : category;
    return into(categories).insert(categoryWithId);
  }

  // ==================== CUSTOMERS ====================
  // (Kode Pelanggan Anda tetap di sini... tidak berubah)
  Future<List<CustomerData>> getAllCustomers() => select(customers).get();
  Future<List<CustomerData>> getActiveCustomers() {
    return (select(customers)..where((c) => c.isActive.equals(true))).get();
  }
  Future<CustomerData?> getCustomerById(String id) {
    return (select(customers)..where((c) => c.id.equals(id))).getSingleOrNull();
  }
  Future<int> insertCustomer(CustomersCompanion customer) {
    final customerWithId = customer.id == const Value.absent()
        ? customer.copyWith(id: Value(uuid.v4()))
        : customer;
    return into(customers).insert(customerWithId);
  }
  Future<bool> updateCustomer(CustomersCompanion customer) {
    return update(customers).replace(customer);
  }
  Future<int> updateCustomerDebt(String customerId, double newDebt) {
    return (update(customers)..where((c) => c.id.equals(customerId)))
        .write(CustomersCompanion(
          totalDebt: Value(newDebt),
          updatedAt: Value(DateTime.now()),
        ));
  }

  // ==================== TRANSACTIONS ====================
  // (Kode Transaksi Anda yang ada tetap di sini... tidak berubah)
  Future<List<TransactionData>> getAllTransactions() {
    return (select(transactions)
      ..orderBy([(t) => OrderingTerm.desc(t.transactionDate)])).get();
  }

  Stream<List<TransactionWithCustomer>> watchAllTransactionsWithCustomer() {
    final query = select(transactions).join([
      innerJoin(customers, customers.id.equalsExp(transactions.customerId))
    ]);
    query.orderBy([OrderingTerm.desc(transactions.transactionDate)]);
    return query.watch().map((rows) {
      return rows.map((row) {
        return TransactionWithCustomer(
          row.readTable(transactions),
          row.readTable(customers),
        );
      }).toList();
    });
  }
  
  Future<TransactionData?> getTransactionById(String id) {
    return (select(transactions)..where((t) => t.id.equals(id))).getSingleOrNull();
  }
  
  Future<List<TransactionData>> getTransactionsByCustomer(String customerId) {
    return (select(transactions)
      ..where((t) => t.customerId.equals(customerId))
      ..orderBy([(t) => OrderingTerm.desc(t.transactionDate)])).get();
  }
  
  Future<List<TransactionData>> getActiveTransactions() {
    return (select(transactions)
      ..where((t) => t.status.equals('active'))
      ..orderBy([(t) => OrderingTerm.asc(t.nextPaymentDue)])).get();
  }
  
  Future<int> insertTransaction(TransactionsCompanion transaction) {
    final transactionWithId = transaction.id == const Value.absent()
        ? transaction.copyWith(id: Value(uuid.v4()))
        : transaction;
    return into(transactions).insert(transactionWithId);
  }
  
  Future<bool> updateTransaction(TransactionsCompanion transaction) {
    return update(transactions).replace(transaction);
  }

  // ==================== TRANSACTION ITEMS ====================
  // (Kode Item Transaksi Anda tetap di sini... tidak berubah)
  Future<List<TransactionItemData>> getTransactionItems(String transactionId) {
    return (select(transactionItems)
      ..where((ti) => ti.transactionId.equals(transactionId))).get();
  }
  
  Future<int> insertTransactionItem(TransactionItemsCompanion item) {
    final itemWithId = item.id == const Value.absent()
        ? item.copyWith(id: Value(uuid.v4()))
        : item;
    return into(transactionItems).insert(itemWithId);
  }

  // ==================== PAYMENTS ====================
  // (Kode Pembayaran Anda tetap di sini... tidak berubah)
  Future<List<PaymentData>> getAllPayments() {
    return (select(payments)
      ..orderBy([(p) => OrderingTerm.desc(p.paymentDate)])).get();
  }
  
  Future<List<PaymentData>> getPaymentsByTransaction(String transactionId) {
    return (select(payments)
      ..where((p) => p.transactionId.equals(transactionId))
      ..orderBy([(p) => OrderingTerm.asc(p.installmentNumber)])).get();
  }
  
  Future<int> insertPayment(PaymentsCompanion payment) {
    final paymentWithId = payment.id == const Value.absent()
        ? payment.copyWith(id: Value(uuid.v4()))
        : payment;
    return into(payments).insert(paymentWithId);
  }

  // ==================== USERS, EXPENSES, SETTINGS ====================
  // (Kode Anda yang lain tetap di sini... tidak berubah)
  Future<UserData?> getUserByUsername(String username) {
    return (select(users)..where((u) => u.username.equals(username)))
        .getSingleOrNull();
  }
  Future<List<UserData>> getAllUsers() => select(users).get();
  Future<List<ExpenseData>> getAllExpenses() {
    return (select(expenses)
      ..orderBy([(e) => OrderingTerm.desc(e.expenseDate)])).get();
  }
  Future<int> insertExpense(ExpensesCompanion expense) {
    final expenseWithId = expense.id == const Value.absent()
        ? expense.copyWith(id: Value(uuid.v4()))
        : expense;
    return into(expenses).insert(expenseWithId);
  }
  Future<StoreSettingData?> getStoreSettings() {
    return (select(storeSettings)..where((s) => s.id.equals(1)))
        .getSingleOrNull();
  }
  Future<bool> updateStoreSettings(StoreSettingsCompanion settings) {
    return update(storeSettings).replace(settings);
  }

/// Method yang hilang #1: Stream untuk pembayaran
  Stream<List<PaymentData>> watchPaymentsForTransaction(String transactionId) {
    return (select(payments)
          ..where((p) => p.transactionId.equals(transactionId))
          ..orderBy([(p) => OrderingTerm.asc(p.installmentNumber)]))
        .watch();
  }

  /// Method yang hilang #2: Query kompleks untuk detail transaksi
  Future<TransactionFullDetails> getFullTransactionDetails(String transactionId) async {
    // ... (Logika method ini sudah benar, tidak ada perubahan) ...
    // 1. Ambil transaksi dan customer (JOIN)
    final transactionQuery = select(transactions).join([
      innerJoin(customers, customers.id.equalsExp(transactions.customerId))
    ])
      ..where(transactions.id.equals(transactionId));
    
    final row = await transactionQuery.getSingle();
    final transactionData = row.readTable(transactions);
    final customerData = row.readTable(customers);

    // 2. Ambil semua item untuk transaksi tsb
    final itemsList = await (select(transactionItems)
          ..where((ti) => ti.transactionId.equals(transactionId)))
        .get();
        
    // 3. Ambil semua pembayaran untuk transaksi tsb
    final paymentsList = await getPaymentsByTransaction(transactionId);

    // 4. Gabungkan ke dalam data class kustom
    return TransactionFullDetails(
      transaction: transactionData,
      customer: customerData,
      items: itemsList,
      payments: paymentsList,
    );
  }
  
  /// Method yang hilang #3: Query agregat kustom untuk statistik
  Future<DashboardStats> getDashboardStats() async {
    // ... (Logika method ini sudah benar, tidak ada perubahan) ...
    final totalRevenueQuery = customSelect(
      'SELECT SUM(total_paid) as totalRevenue FROM transactions',
      readsFrom: {transactions},
    );
    final totalReceivablesQuery = customSelect(
      'SELECT SUM(remaining_debt) as totalReceivables FROM transactions WHERE status = ?',
      variables: [Variable.withString('active')],
      readsFrom: {transactions},
    );
    final activeTransactionsQuery = customSelect(
      'SELECT COUNT(id) as activeCount FROM transactions WHERE status = ?',
      variables: [Variable.withString('active')],
      readsFrom: {transactions},
    );
    final completedTransactionsQuery = customSelect(
      'SELECT COUNT(id) as completedCount FROM transactions WHERE status = ?',
      variables: [Variable.withString('completed')],
      readsFrom: {transactions},
    );

    final totalRevenue = await totalRevenueQuery.map((row) => row.read<double>('totalRevenue')).getSingleOrNull() ?? 0.0;
    final totalReceivables = await totalReceivablesQuery.map((row) => row.read<double>('totalReceivables')).getSingleOrNull() ?? 0.0;
    final activeTransactions = await activeTransactionsQuery.map((row) => row.read<int>('activeCount')).getSingleOrNull() ?? 0;
    final completedTransactions = await completedTransactionsQuery.map((row) => row.read<int>('completedCount')).getSingleOrNull() ?? 0;
    
    return DashboardStats(
      totalRevenue: totalRevenue,
      totalReceivables: totalReceivables,
      activeTransactions: activeTransactions,
      completedTransactions: completedTransactions,
    );
  }

  /// Method yang hilang #4: Filter berdasarkan rentang tanggal
  Stream<List<TransactionWithCustomer>> watchTransactionsByDateRange(DateTime start, DateTime end) {
    final query = select(transactions).join([
      innerJoin(customers, customers.id.equalsExp(transactions.customerId))
    ])
      // [FIX] isBetween membutuhkan Value(), bukan DateTime langsung
      ..where(transactions.transactionDate.isBetween(Value(start), Value(end)));
      
    query.orderBy([OrderingTerm.desc(transactions.transactionDate)]);
    
    return query.watch().map((rows) {
      return rows.map((row) {
        return TransactionWithCustomer(
          row.readTable(transactions),
          row.readTable(customers),
        );
      }).toList();
    });
  }
  
  /// Method yang hilang #5: Filter berdasarkan status
  Stream<List<TransactionWithCustomer>> watchTransactionsByStatus(List<String> statuses) {
    // ... (Logika method ini sudah benar, tidak ada perubahan) ...
    final query = select(transactions).join([
      innerJoin(customers, customers.id.equalsExp(transactions.customerId))
    ])
      ..where(transactions.status.isIn(statuses));
      
    query.orderBy([OrderingTerm.desc(transactions.transactionDate)]);
    
    return query.watch().map((rows) {
      return rows.map((row) {
        return TransactionWithCustomer(
          row.readTable(transactions),
          row.readTable(customers),
        );
      }).toList();
    });
  }

  // ========================================================
  // ==== [AKHIR] KODE BARU UNTUK MEMPERBAIKI EROR ====
  // ========================================================
}=

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'asverta_db.sqlite'));
    return NativeDatabase(file);
  });
}