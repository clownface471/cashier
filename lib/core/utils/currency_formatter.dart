import 'package:intl/intl.dart';

/// Currency formatter utility for Indonesian Rupiah
class CurrencyFormatter {
  static final _formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  /// Format number to Rupiah currency
  /// Example: 50000 -> "Rp 50.000"
  static String format(double amount) {
    return _formatter.format(amount);
  }

  /// Format number to Rupiah currency (from int)
  static String formatInt(int amount) {
    return _formatter.format(amount);
  }

  /// Format to compact currency (for small spaces)
  /// Example: 1000000 -> "Rp 1jt"
  static String formatCompact(double amount) {
    if (amount >= 1000000000) {
      return 'Rp ${(amount / 1000000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000000) {
      return 'Rp ${(amount / 1000000).toStringAsFixed(1)}jt';
    } else if (amount >= 1000) {
      return 'Rp ${(amount / 1000).toStringAsFixed(0)}rb';
    }
    return format(amount);
  }

  /// Parse formatted currency string to double
  /// Example: "Rp 50.000" -> 50000.0
  static double parse(String formatted) {
    final cleaned = formatted
        .replaceAll('Rp', '')
        .replaceAll(' ', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');
    return double.tryParse(cleaned) ?? 0.0;
  }
}