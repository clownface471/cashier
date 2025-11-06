import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/payment_repository.dart';
import 'database_provider.dart';

part 'payment_provider.g.dart';

// Repository Provider
@riverpod
PaymentRepository paymentRepository(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return PaymentRepository(database);
}

// Watch payments for a specific transaction (Stream)
@riverpod
Stream<List<PaymentData>> paymentsStream(
  Ref ref,
  String transactionId,
) {
  final repository = ref.watch(paymentRepositoryProvider);
  return repository.watchPaymentsByTransaction(transactionId);
}

// Get payment summary for a transaction
@riverpod
Future<Map<String, dynamic>> paymentSummary(
  Ref ref,
  String transactionId,
) {
  final repository = ref.watch(paymentRepositoryProvider);
  return repository.getPaymentSummary(transactionId);
}

// Get overdue transactions
@riverpod
Future<List<TransactionData>> overdueTransactions(Ref ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return repository.getOverdueTransactions();
}
