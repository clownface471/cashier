import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/payment_repository.dart';
import 'database_provider.dart';

part 'payment_provider.g.dart';

// Repository Provider
@riverpod
PaymentRepository paymentRepository(PaymentRepositoryRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return PaymentRepository(database);
}

// Watch payments for a specific transaction (Stream)
@riverpod
Stream<List<PaymentData>> paymentsStream(
  PaymentsStreamRef ref,
  String transactionId,
) {
  final repository = ref.watch(paymentRepositoryProvider);
  return repository.watchPaymentsByTransaction(transactionId);
}

// Get payment summary for a transaction
@riverpod
Future<Map<String, dynamic>> paymentSummary(
  PaymentSummaryRef ref,
  String transactionId,
) {
  final repository = ref.watch(paymentRepositoryProvider);
  return repository.getPaymentSummary(transactionId);
}

// Get overdue transactions
@riverpod
Future<List<TransactionData>> overdueTransactions(OverdueTransactionsRef ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return repository.getOverdueTransactions();
}