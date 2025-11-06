// Report Models for Asverta POS
// This file contains models and enums used in the reporting UI

/// Enum defining all available report types that users can generate
/// Based on Asverta Technical Brief requirements for comprehensive reporting
enum ReportFilterType {
  transaction,     // Laporan Transaksi
  payment,         // Laporan Pembayaran
  productSold,     // Laporan Produk Terjual
  stock,           // Laporan Stok Barang
  category,        // Laporan per Kategori
  expense,         // Laporan Pengeluaran
  perCashier,      // Laporan per Kasir
  paymentMethod,   // Laporan Metode Pembayaran
  allReceivables,  // Laporan Semua Piutang
  salesToday,      // Laporan Penjualan Hari Ini
  salesThisMonth,  // Laporan Penjualan Bulan Ini
}

/// Report date range options
enum ReportDateRange {
  today,
  yesterday,
  thisWeek,
  thisMonth,
  lastMonth,
  thisYear,
  custom,
}

/// Report format options for export
enum ReportExportFormat {
  pdf,
  excel,
  csv,
}

/// Model class for report filters
class ReportFilter {
  final ReportFilterType type;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? categoryId;
  final String? productId;
  final String? customerId;
  final String? cashierId;
  
  const ReportFilter({
    required this.type,
    this.startDate,
    this.endDate,
    this.categoryId,
    this.productId,
    this.customerId,
    this.cashierId,
  });
}

/// Model for report summary statistics
class ReportSummary {
  final String title;
  final String value;
  final String? subtitle;
  final bool isHighlighted;
  
  const ReportSummary({
    required this.title,
    required this.value,
    this.subtitle,
    this.isHighlighted = false,
  });
}