import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/transaction_repository.dart';
import 'database_provider.dart';

part 'transaction_provider.g.dart';

enum ReportFilterType {
  allReceivables,
  salesToday,
  salesThisMonth,
}

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return TransactionRepository(database);
}

@riverpod
Stream<List<TransactionWithCustomer>> transactions(TransactionsRef ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.watchAllTransactions();
}

@riverpod
Future<TransactionFullDetails> transactionDetails(
    TransactionDetailsRef ref, String transactionId) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getFullTransactionDetails(transactionId);
}

@riverpod
Stream<List<PaymentData>> paymentsForTransaction(
    PaymentsForTransactionRef ref, String transactionId) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.watchPaymentsForTransaction(transactionId);
}

@riverpod
Future<DashboardStats> dashboardStats(DashboardStatsRef ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getDashboardStats();
}

@riverpod
Stream<List<TransactionWithCustomer>> filteredTransactions(
    FilteredTransactionsRef ref, ReportFilterType filterType) {
  final repository = ref.watch(transactionRepositoryProvider);
  final now = DateTime.now();

  switch (filterType) {
    case ReportFilterType.allReceivables:
      return repository.watchTransactionsByStatus(['active', 'overdue']);
    case ReportFilterType.salesToday:
      final startOfDay = DateTime(now.year, now.month, now.day);
      final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);
      return repository.watchTransactionsByDateRange(startOfDay, endOfDay);
    case ReportFilterType.salesThisMonth:
      final startOfMonth = DateTime(now.year, now.month, 1);
      final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
      return repository.watchTransactionsByDateRange(startOfMonth, endOfMonth);
  }
}