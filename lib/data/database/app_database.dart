import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

import 'tables/products_table.dart';
import 'tables/customers_table.dart';
import 'tables/transactions_table.dart';
import 'tables/payments_table.dart';
import 'tables/other_tables.dart';

part 'app_database.g.dart';

const uuid = Uuid();

class TransactionWithCustomer {
  final TransactionData transaction;
  final CustomerData customer;

  TransactionWithCustomer({
    required this.transaction,
    required this.customer,
  });
}

class TransactionFullDetails {
  final TransactionData transaction;
  final CustomerData customer;
  final List<TransactionItemData> items;

  TransactionFullDetails({
    required this.transaction,
    required this.customer,
    required this.items,
  });
}

class DashboardStats {
  final double totalReceivables;
  final double totalSalesToday;
  final int newCustomersThisMonth;
  final int transactionsToday;

  DashboardStats({
    required this.totalReceivables,
    required this.totalSalesToday,
    required this.newCustomersThisMonth,
    required this.transactionsToday,
  });
}

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
        
        await into(storeSettings).insert(
          StoreSettingsCompanion.insert(
            id: const Value(1),
            storeName: const Value('Toko Saya'),
            currencySymbol: const Value('Rp'),
            defaultInterestRate: const Value(2.0),
            useStock: const Value(true),
          ),
        );

        await into(users).insert(
          UsersCompanion.insert(
            id: uuid.v4(),
            username: 'admin',
            password: 'admin123',
            fullName: 'Administrator',
            role: const Value('owner'),
            isActive: const Value(true),
          ),
        );
      },
    );
  }

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
  
  Future<List<CategoryData>> getAllCategories() => select(categories).get();
  
  Future<int> insertCategory(CategoriesCompanion category) {
    final categoryWithId = category.id == const Value.absent()
        ? category.copyWith(id: Value(uuid.v4()))
        : category;
    return into(categories).insert(categoryWithId);
  }
  
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
  
  Stream<List<TransactionWithCustomer>> watchAllTransactionsWithCustomer() {
    final query = select(transactions).join([
      innerJoin(customers, customers.id.equalsExp(transactions.customerId)),
    ])
      ..where(transactions.status.isNotValue('cancelled'))
      ..orderBy([OrderingTerm.desc(transactions.transactionDate)]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return TransactionWithCustomer(
          transaction: row.readTable(transactions),
          customer: row.readTable(customers),
        );
      }).toList();
    });
  }

  Future<TransactionFullDetails> getFullTransactionDetails(String transactionId) async {
    final tx = await (select(transactions)..where((t) => t.id.equals(transactionId))).getSingle();
    final customer = await (select(customers)..where((c) => c.id.equals(tx.customerId))).getSingle();
    final items = await (select(transactionItems)..where((i) => i.transactionId.equals(transactionId))).get();

    return TransactionFullDetails(
      transaction: tx,
      customer: customer,
      items: items,
    );
  }

  Stream<List<PaymentData>> watchPaymentsForTransaction(String transactionId) {
    return (select(payments)
          ..where((p) => p.transactionId.equals(transactionId))
          ..orderBy([(p) => OrderingTerm.asc(p.paymentDate)]))
        .watch();
  }

  Future<DashboardStats> getDashboardStats() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final startOfMonth = DateTime(now.year, now.month, 1);

    final totalReceivables = await (select(transactions)
      ..where((t) => t.status.equals('active')))
      .addColumns([transactions.remainingDebt.sum()])
      .map((row) => row.read(transactions.remainingDebt.sum()) ?? 0.0)
      .getSingle();

    final totalSalesToday = await (select(transactions)
      ..where((t) => t.transactionDate.isBiggerOrEqualValue(startOfDay)))
      .addColumns([transactions.totalPayable.sum()])
      .map((row) => row.read(transactions.totalPayable.sum()) ?? 0.0)
      .getSingle();

    final transactionsToday = await (select(transactions)
      ..where((t) => t.transactionDate.isBiggerOrEqualValue(startOfDay)))
      .addColumns([transactions.id.count()])
      .map((row) => row.read(transactions.id.count()) ?? 0)
      .getSingle();
    
    final newCustomersThisMonth = await (select(customers)
      ..where((c) => c.createdAt.isBiggerOrEqualValue(startOfMonth)))
      .addColumns([customers.id.count()])
      .map((row) => row.read(customers.id.count()) ?? 0)
      .getSingle();

    return DashboardStats(
      totalReceivables: totalReceivables,
      totalSalesToday: totalSalesToday,
      transactionsToday: transactionsToday,
      newCustomersThisMonth: newCustomersThisMonth,
    );
  }

  Stream<List<TransactionWithCustomer>> watchTransactionsByDateRange(DateTime start, DateTime end) {
    final query = select(transactions).join([
      innerJoin(customers, customers.id.equalsExp(transactions.customerId)),
    ])
      ..where(transactions.transactionDate.isBetweenValues(start, end))
      ..where(transactions.status.isNotValue('cancelled'))
      ..orderBy([OrderingTerm.desc(transactions.transactionDate)]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return TransactionWithCustomer(
          transaction: row.readTable(transactions),
          customer: row.readTable(customers),
        );
      }).toList();
    });
  }

  Stream<List<TransactionWithCustomer>> watchTransactionsByStatus(List<String> statuses) {
     final query = select(transactions).join([
      innerJoin(customers, customers.id.equalsExp(transactions.customerId)),
    ])
      ..where(transactions.status.isIn(statuses))
      ..orderBy([OrderingTerm.asc(transactions.nextPaymentDue)]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return TransactionWithCustomer(
          transaction: row.readTable(transactions),
          customer: row.readTable(customers),
        );
      }).toList();
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'asverta_db.sqlite'));
    return NativeDatabase(file);
  });
}