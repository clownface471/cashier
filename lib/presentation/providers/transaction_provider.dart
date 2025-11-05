// [SALIN DAN GANTI SELURUH FILE transaction_provider.dart ANDA DENGAN INI]
import 'package:asverta/data/database/app_database.dart';
import 'package:asverta/data/models/transaction_models.dart';
import 'package:asverta/data/repositories/transaction_repository.dart';
// [FIX] Impor anotasi untuk 'Ref'
import 'package:riverpod_annotation/riverpod_annotation.dart'; 

// [FIX] Impor provider database yang baru saja kita buat
import 'database_provider.dart'; 

part 'transaction_provider.g.dart';

// [FIX] Menggunakan sintaks Riverpod modern
// Menyediakan instance TransactionRepository
@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) {
  // [FIX] Sekarang me-watch 'databaseProvider' yang sudah ada
  final db = ref.watch(databaseProvider); 
  return TransactionRepository(db);
}

// [FIX] Provider untuk stream semua transaksi
@riverpod
Stream<List<TransactionWithCustomer>> transactionsStream(TransactionsStreamRef ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.watchAllTransactions();
}

// [FIX] Provider untuk detail satu transaksi
@riverpod
Future<TransactionFullDetails> transactionDetails(
    TransactionDetailsRef ref, String transactionId) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getFullTransactionDetails(transactionId);
}

// [FIX] Provider untuk stream pembayaran
@riverpod
Stream<List<PaymentData>> paymentsForTransaction(
    PaymentsForTransactionRef ref, String transactionId) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.watchPaymentsForTransaction(transactionId);
}

// [FIX] Provider untuk statistik dashboard
@riverpod
Future<DashboardStats> dashboardStats(DashboardStatsRef ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getDashboardStats();
}

// [FIX] Provider untuk transaksi yang difilter
// Ini memerlukan parameter, jadi kita buat family
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
  
  // Default: kembalikan semua transaksi jika tidak ada filter
  return repository.watchAllTransactions();
}