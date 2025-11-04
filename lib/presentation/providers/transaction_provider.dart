import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/transaction_repository.dart';
import 'database_provider.dart';

part 'transaction_provider.g.dart';

// Repository Provider
@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return TransactionRepository(database);
}

// Watch all transactions with customer data (Stream)
@riverpod
Stream<List<TransactionWithCustomer>> transactionsStream(
    TransactionsStreamRef ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.watchAllTransactionsWithCustomer();
}
