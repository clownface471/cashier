import 'package:drift/drift.dart';

/// Main transactions table for credit sales
@DataClassName('TransactionData')
class Transactions extends Table {
  // Primary Key
  TextColumn get id => text()();
  
  // Transaction Number (unique, human-readable)
  TextColumn get transactionNumber => text().withLength(min: 1, max: 50)();
  
  // Customer & User
  TextColumn get customerId => text()();
  TextColumn get userId => text()(); // Kasir yang melayani
  
  // Transaction Type
  TextColumn get type => text().withDefault(const Constant('credit'))(); // 'credit' or 'cash'
  
  // Amounts
  RealColumn get subtotal => real()(); // Total sebelum DP
  RealColumn get downPayment => real().withDefault(const Constant(0))(); // DP/Uang Muka
  RealColumn get remainingAmount => real()(); // Sisa yang harus dicicil
  
  // Credit Terms
  IntColumn get tenor => integer().withDefault(const Constant(0))(); // Jumlah cicilan (bulan)
  RealColumn get interestRate => real().withDefault(const Constant(0))(); // Bunga (%)
  RealColumn get interestAmount => real().withDefault(const Constant(0))(); // Total bunga (Rp)
  RealColumn get adminFee => real().withDefault(const Constant(0))(); // Biaya admin
  
  // Installment Details
  RealColumn get monthlyInstallment => real()(); // Cicilan per bulan
  RealColumn get totalPayable => real()(); // Total yang harus dibayar (subtotal + bunga + admin - DP)
  
  // Payment Status
  RealColumn get totalPaid => real().withDefault(const Constant(0))(); // Total sudah dibayar
  RealColumn get remainingDebt => real()(); // Sisa hutang
  IntColumn get paidInstallments => integer().withDefault(const Constant(0))(); // Sudah bayar berapa kali
  IntColumn get remainingInstallments => integer()(); // Sisa cicilan
  
  // Status
  TextColumn get status => text().withDefault(const Constant('active'))(); // active, completed, overdue, cancelled
  
  // Payment Method for DP
  TextColumn get downPaymentMethod => text().nullable()(); // cash, transfer, etc
  
  // Due Date
  DateTimeColumn get firstPaymentDate => dateTime().nullable()(); // Tanggal cicilan pertama
  DateTimeColumn get lastPaymentDate => dateTime().nullable()(); // Tanggal pembayaran terakhir
  DateTimeColumn get nextPaymentDue => dateTime().nullable()(); // Jatuh tempo cicilan berikutnya
  
  // Notes
  TextColumn get notes => text().nullable()();
  
  // Timestamps
  DateTimeColumn get transactionDate => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Transaction items (products in each transaction)
@DataClassName('TransactionItemData')
class TransactionItems extends Table {
  TextColumn get id => text()();
  TextColumn get transactionId => text()();
  TextColumn get productId => text()();
  
  // Product snapshot (harga pada saat transaksi)
  TextColumn get productName => text()();
  RealColumn get costPrice => real()(); // Harga modal saat itu
  RealColumn get sellingPrice => real()(); // Harga jual saat itu
  
  // Quantity
  IntColumn get quantity => integer()();
  RealColumn get subtotal => real()(); // sellingPrice * quantity
  
  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}