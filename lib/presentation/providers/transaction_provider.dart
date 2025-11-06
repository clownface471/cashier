import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/models/transaction_models.dart';
import '../../data/repositories/transaction_repository.dart';
import 'database_provider.dart';

part 'transaction_provider.g.dart';

// Repository Provider
@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) {
  // FIX: Changed from 'databaseProvider' to 'appDatabaseProvider'
  final database = ref.watch(appDatabaseProvider);
  return TransactionRepository(database);
}

// Watch all transactions (Stream)
@riverpod
Stream<List<TransactionWithCustomer>> transactionsStream(
    TransactionsStreamRef ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.watchAllTransactions();
}

// Get transaction details
@riverpod
Future<TransactionFullDetails> transactionDetails(
  TransactionDetailsRef ref,
  String transactionId,
) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getFullTransactionDetails(transactionId);
}

// Watch payments for a specific transaction
@riverpod
Stream<List<PaymentData>> paymentsForTransaction(
  PaymentsForTransactionRef ref,
  String transactionId,
) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.watchPaymentsForTransaction(transactionId);
}

// Get dashboard statistics
@riverpod
Future<DashboardStats> dashboardStats(DashboardStatsRef ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getDashboardStats();
}

// Watch filtered transactions
@riverpod
Stream<List<TransactionWithCustomer>> filteredTransactions(
  FilteredTransactionsRef ref, {
  DateTime? startDate,
  DateTime? endDate,
  List<String>? statuses,
}) {
  final repository = ref.watch(transactionRepositoryProvider);

  if (startDate != null && endDate != null) {
    return repository.watchTransactionsByDateRange(startDate, endDate);
  }
  if (statuses != null && statuses.isNotEmpty) {
    return repository.watchTransactionsByStatus(statuses);
  }

  // Default: return all transactions if no filter
  return repository.watchAllTransactions();
}
