import 'package:riverpod_annotation/riverpod_annotation.dart';
// ==== FIX: Path import salah ====
// '..' (satu tingkat naik) hanya membawa kita ke 'lib/presentation'.
// Kita perlu '..' (dua tingkat naik) untuk sampai ke 'lib/' lalu masuk ke 'data/'.
import '../../data/database/app_database.dart';
// ==== AKHIR FIX ====
import '../../data/repositories/customer_repository.dart';
import 'database_provider.dart';

part 'customer_provider.g.dart';

// Repository Provider
@riverpod
CustomerRepository customerRepository(CustomerRepositoryRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return CustomerRepository(database);
}

// Watch all customers (Stream)
@riverpod
Stream<List<CustomerData>> customersStream(CustomersStreamRef ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return repository.watchAllCustomers();
}

// Search customers (Future)
@riverpod
Future<List<CustomerData>> searchCustomers(
  SearchCustomersRef ref,
  String query,
) {
  final repository = ref.watch(customerRepositoryProvider);
  return repository.searchCustomers(query);
}

