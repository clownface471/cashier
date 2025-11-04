import 'package:drift/drift.dart';

/// Users table for authentication and authorization
@DataClassName('UserData')
class Users extends Table {
  TextColumn get id => text()();
  
  // Credentials
  TextColumn get username => text().withLength(min: 3, max: 50)();
  TextColumn get password => text()(); // Hashed password
  TextColumn get pin => text().withLength(min: 4, max: 6).nullable()(); // Quick PIN login
  
  // User Info
  TextColumn get fullName => text().withLength(min: 1, max: 200)();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  
  // Role & Permissions
  TextColumn get role => text().withDefault(const Constant('cashier'))(); // owner, cashier
  
  // Status
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  
  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastLoginAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Expenses table for operational costs
@DataClassName('ExpenseData')
class Expenses extends Table {
  TextColumn get id => text()();
  
  // Expense Details
  TextColumn get title => text().withLength(min: 1, max: 200)();
  TextColumn get description => text().nullable()();
  RealColumn get amount => real()();
  
  // Category
  TextColumn get category => text()(); // salary, electricity, rent, supplies, etc
  
  // Payment
  TextColumn get paymentMethod => text()(); // cash, transfer, etc
  
  // Relations
  TextColumn get userId => text()(); // Yang mencatat
  
  // Evidence
  TextColumn get receiptImage => text().nullable()(); // Photo of receipt
  
  // Timestamps
  DateTimeColumn get expenseDate => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Store settings table (singleton pattern - only one row)
@DataClassName('StoreSettingData')
class StoreSettings extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))(); // Always 1
  
  // Store Information
  TextColumn get storeName => text().withDefault(const Constant('Toko Saya'))();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  
  // Logo & Branding
  TextColumn get logoUrl => text().nullable()(); // Local path
  
  // Receipt Settings
  TextColumn get receiptHeader => text().nullable()(); // Custom header text
  TextColumn get receiptFooter => text().nullable()(); // Custom footer text
  IntColumn get receiptPaperSize => integer().withDefault(const Constant(58))(); // 58mm or 80mm
  
  // Business Settings
  BoolColumn get useStock => boolean().withDefault(const Constant(true))();
  BoolColumn get allowNegativeStock => boolean().withDefault(const Constant(false))();
  RealColumn get defaultInterestRate => real().withDefault(const Constant(2.0))(); // Default bunga (%)
  RealColumn get defaultAdminFee => real().withDefault(const Constant(0))();
  
  // Currency
  TextColumn get currencySymbol => text().withDefault(const Constant('Rp'))();
  
  // Timestamps
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}