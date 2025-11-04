import 'package:drift/drift.dart';

/// Payments table for installment records
@DataClassName('PaymentData')
class Payments extends Table {
  // Primary Key
  TextColumn get id => text()();
  
  // Payment Number (unique, human-readable)
  TextColumn get paymentNumber => text().withLength(min: 1, max: 50)();
  
  // Relations
  TextColumn get transactionId => text()();
  TextColumn get customerId => text()();
  TextColumn get userId => text()(); // Kasir yang menerima pembayaran
  
  // Payment Details
  RealColumn get amount => real()(); // Jumlah yang dibayar
  TextColumn get paymentMethod => text()(); // cash, transfer, debit, credit, etc
  IntColumn get installmentNumber => integer()(); // Cicilan ke-berapa
  
  // Payment Type
  TextColumn get paymentType => text().withDefault(const Constant('installment'))(); // down_payment, installment
  
  // Status
  TextColumn get status => text().withDefault(const Constant('completed'))(); // completed, pending, cancelled
  
  // Evidence (for transfer)
  TextColumn get paymentProof => text().nullable()(); // Photo of transfer receipt
  TextColumn get referenceNumber => text().nullable()(); // Transfer reference number
  
  // Late Payment
  BoolColumn get isLate => boolean().withDefault(const Constant(false))();
  IntColumn get lateDays => integer().withDefault(const Constant(0))();
  RealColumn get lateFee => real().withDefault(const Constant(0))(); // Denda keterlambatan
  
  // Notes
  TextColumn get notes => text().nullable()();
  
  // Timestamps
  DateTimeColumn get paymentDate => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get dueDate => dateTime().nullable()(); // Tanggal jatuh tempo
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}