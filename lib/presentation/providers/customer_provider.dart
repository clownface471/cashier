import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/customer_repository.dart';
import 'database_provider.dart';

part 'customer_provider.g.dart';

// Repository Provider
@riverpod
CustomerRepository customerRepository(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return CustomerRepository(database);
}

// Watch all customers (Stream)
@riverpod
Stream<List<CustomerData>> customersStream(Ref ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return repository.watchAllCustomers();
}

// ==== TAMBAHAN BARU YANG HILANG ====
// Get active customers only
@riverpod
Future<List<CustomerData>> activeCustomers(Ref ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return repository.getActiveCustomers();
}
// ==== AKHIR TAMBAHAN BARU ====

// Search customers (Future)
@riverpod
Future<List<CustomerData>> searchCustomers(
  Ref ref,
  String query,
) {
  final repository = ref.watch(customerRepositoryProvider);
  return repository.searchCustomers(query);
}
