import 'package:asverta/data/database/app_database.dart';

/// Data class kustom untuk menampung detail transaksi lengkap.
/// Ini bukan tabel database, tapi hasil dari query JOIN.
class TransactionFullDetails {
  final TransactionData transaction;
  final CustomerData customer;
  final List<TransactionItemData> items;
  final List<PaymentData> payments;

  TransactionFullDetails({
    required this.transaction,
    required this.customer,
    required this.items,
    required this.payments,
  });
}

/// Data class kustom untuk statistik dashboard.
/// Ini bukan tabel database, tapi hasil dari query agregat.
class DashboardStats {
  final double totalRevenue; // Total pendapatan (TotalPaid)
  final double totalReceivables; // Total piutang (RemainingDebt)
  final int activeTransactions;
  final int completedTransactions;

  DashboardStats({
    required this.totalRevenue,
    required this.totalReceivables,
    required this.activeTransactions,
    required this.completedTransactions,
  });
}