import 'package:drift/drift.dart';

/// Transaction Models for Asverta POS
/// This file contains data models for transaction-related operations

/// Model for dashboard statistics
class DashboardStats {
  final double totalRevenue;
  final double totalReceivables;
  final int activeTransactions;
  final int completedTransactions;

  // Additional fields for UI display
  final double totalSalesToday;
  final int transactionsToday;
  final int newCustomersThisMonth;

  const DashboardStats({
    required this.totalRevenue,
    required this.totalReceivables,
    required this.activeTransactions,
    required this.completedTransactions,
    this.totalSalesToday = 0.0,
    this.transactionsToday = 0,
    this.newCustomersThisMonth = 0,
  });

  DashboardStats copyWith({
    double? totalRevenue,
    double? totalReceivables,
    int? activeTransactions,
    int? completedTransactions,
    double? totalSalesToday,
    int? transactionsToday,
    int? newCustomersThisMonth,
  }) {
    return DashboardStats(
      totalRevenue: totalRevenue ?? this.totalRevenue,
      totalReceivables: totalReceivables ?? this.totalReceivables,
      activeTransactions: activeTransactions ?? this.activeTransactions,
      completedTransactions:
          completedTransactions ?? this.completedTransactions,
      totalSalesToday: totalSalesToday ?? this.totalSalesToday,
      transactionsToday: transactionsToday ?? this.transactionsToday,
      newCustomersThisMonth:
          newCustomersThisMonth ?? this.newCustomersThisMonth,
    );
  }
}

/// Model for full transaction details including related data
class TransactionFullDetails {
  final dynamic transaction;
  final dynamic customer;
  final List<dynamic> items;
  final List<dynamic> payments;

  const TransactionFullDetails({
    required this.transaction,
    required this.customer,
    required this.items,
    required this.payments,
  });
}

/// Model for transaction item with product details
class TransactionItemWithProduct {
  final dynamic item;
  final dynamic product;

  const TransactionItemWithProduct({
    required this.item,
    required this.product,
  });
}

/// Model for payment summary
class PaymentSummary {
  final double totalPaid;
  final double remainingAmount;
  final int paidInstallments;
  final int remainingInstallments;

  const PaymentSummary({
    required this.totalPaid,
    required this.remainingAmount,
    required this.paidInstallments,
    required this.remainingInstallments,
  });
}

/// Model for transaction summary
class TransactionSummary {
  final String id;
  final String transactionNumber;
  final String customerName;
  final double totalAmount;
  final double paidAmount;
  final double remainingAmount;
  final String status;
  final DateTime transactionDate;

  const TransactionSummary({
    required this.id,
    required this.transactionNumber,
    required this.customerName,
    required this.totalAmount,
    required this.paidAmount,
    required this.remainingAmount,
    required this.status,
    required this.transactionDate,
  });
}
