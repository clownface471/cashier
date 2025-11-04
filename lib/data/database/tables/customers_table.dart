import 'package:drift/drift.dart';

/// Customers table for credit management
@DataClassName('CustomerData')
class Customers extends Table {
  // Primary Key
  TextColumn get id => text()();

  // Customer Information
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get phone => text().withLength(max: 20).nullable()();
  TextColumn get email => text().withLength(max: 100).nullable()();
  
  // Address
  TextColumn get address => text().nullable()();
  TextColumn get city => text().withLength(max: 100).nullable()();
  TextColumn get province => text().withLength(max: 100).nullable()();
  TextColumn get postalCode => text().withLength(max: 10).nullable()();
  
  // Identity (KTP/ID Card) - Important for credit
  TextColumn get idCardNumber => text().withLength(max: 50).nullable()();
  TextColumn get idCardImageUrl => text().nullable()(); // Photo of ID card
  
  // Credit Profile
  RealColumn get creditLimit => real().withDefault(const Constant(0))(); // Max kredit yg diizinkan
  RealColumn get totalDebt => real().withDefault(const Constant(0))(); // Total hutang saat ini
  IntColumn get totalTransactions => integer().withDefault(const Constant(0))();
  
  // Customer Rating (1-5, for internal use)
  IntColumn get rating => integer().withDefault(const Constant(3))();
  
  // Notes
  TextColumn get notes => text().nullable()();
  
  // Status
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isBlacklisted => boolean().withDefault(const Constant(false))();
  
  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastTransactionDate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}