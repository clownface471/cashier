import 'package:drift/drift.dart';
// ==== FIX: Lupa import file database ====
// Ini dibutuhkan agar repository tahu apa itu 'CustomerData' & 'CustomersCompanion'.
import '../database/app_database.dart';
// ==== AKHIR FIX ====

/// Repository for Customer CRUD operations
class CustomerRepository {
  final AppDatabase _database;

  CustomerRepository(this._database);

  // Get all customers
  Stream<List<CustomerData>> watchAllCustomers() {
    return (_database.select(_database.customers)
          ..orderBy([(c) => OrderingTerm.asc(c.name)]))
        .watch();
  }

  Future<List<CustomerData>> getAllCustomers() {
    return _database.getAllCustomers();
  }

  Future<List<CustomerData>> getActiveCustomers() {
    return _database.getActiveCustomers();
  }

  // Get customer by ID
  Future<CustomerData?> getCustomerById(String id) {
    return _database.getCustomerById(id);
  }

  // Search customers
  Future<List<CustomerData>> searchCustomers(String query) {
    final lowercaseQuery = query.toLowerCase();
    return (_database.select(_database.customers)
          ..where((c) =>
              c.name.lower().like('%$lowercaseQuery%') |
              c.phone.like('%$lowercaseQuery%') |
              c.idCardNumber.like('%$lowercaseQuery%')))
        .get();
  }

  // Create customer
  Future<int> createCustomer({
    required String name,
    String? phone,
    String? address,
    String? idCardNumber,
    String? notes,
  }) {
    // Panggil constructor default, BUKAN .insert(), agar ID di-generate otomatis
    return _database.insertCustomer(
      CustomersCompanion(
        name: Value(name),
        phone: Value(phone),
        address: Value(address),
        idCardNumber: Value(idCardNumber),
        notes: Value(notes),
        isActive: const Value(true),
      ),
    );
  }

  // Update customer
  Future<bool> updateCustomer(CustomerData customer) {
    // .replace akan meng-update semua field, termasuk 'updatedAt'
    return _database.updateCustomer(customer.toCompanion(true));
  }

  // Soft delete (set isActive to false)
  Future<int> softDeleteCustomer(String id) {
    return (_database.update(_database.customers)..where((c) => c.id.equals(id)))
        .write(const CustomersCompanion(isActive: Value(false)));
  }

  // Hard delete
  Future<int> deleteCustomer(String id) {
    return (_database.delete(_database.customers)..where((c) => c.id.equals(id)))
        .go();
  }
}

