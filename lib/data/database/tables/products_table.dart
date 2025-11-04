import 'package:drift/drift.dart';

/// Products table for managing inventory
@DataClassName('ProductData')
class Products extends Table {
  // Primary Key - we'll generate UUID in the companion
  TextColumn get id => text()();

  // Product Information
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get sku => text().withLength(max: 100).nullable()();
  TextColumn get barcode => text().withLength(max: 100).nullable()();
  
  // Pricing
  RealColumn get costPrice => real().withDefault(const Constant(0))(); // Harga Modal
  RealColumn get sellingPrice => real().withDefault(const Constant(0))(); // Harga Jual
  
  // Stock Management
  IntColumn get stock => integer().withDefault(const Constant(0))();
  IntColumn get minStock => integer().withDefault(const Constant(0))(); // Alert threshold
  
  // Category (Foreign Key)
  TextColumn get categoryId => text().nullable()();
  
  // Additional Info
  TextColumn get description => text().nullable()();
  TextColumn get imageUrl => text().nullable()(); // Local path or URL
  
  // Status
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  
  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Categories table for product classification
@DataClassName('CategoryData')
class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  @override
  Set<Column> get primaryKey => {id};
}