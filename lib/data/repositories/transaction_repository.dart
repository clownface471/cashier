import 'package:drift/drift.dart';
import '../database/app_database.dart';

/// Repository for Transaction logic
class TransactionRepository {
  final AppDatabase _database;

  TransactionRepository(this._database);

  /// Menonton semua transaksi yang digabung dengan data pelanggannya.
  Stream<List<TransactionWithCustomer>> watchAllTransactionsWithCustomer() {
    return _database.watchAllTransactionsWithCustomer();
  }

  /// Membuat transaksi kredit baru secara atomik (all or nothing)
  Future<void> createCreditTransaction({
    required TransactionsCompanion transactionData,
    required List<TransactionItemsCompanion> items,
    required String customerId,
    required double newTotalDebt,
  }) async {
    // Gunakan fitur 'transaction' dari Drift.
    // Ini memastikan jika salah satu langkah gagal (misal: stok tidak cukup),
    // semua perubahan (insert transaction, insert items) akan dibatalkan.
    await _database.transaction(() async {
      // 1. Masukkan data transaksi utama
      final transactionWithId = transactionData.id == const Value.absent()
          ? transactionData.copyWith(id: Value(uuid.v4()))
          : transactionData;
      
      await _database.insertTransaction(transactionWithId);
      final transactionId = transactionWithId.id.value;

      // 2. Masukkan semua item transaksi
      for (final item in items) {
        // Pastikan item terhubung ke ID transaksi yang benar
        await _database.insertTransactionItem(item.copyWith(
          transactionId: Value(transactionId),
        ));

        // 3. Update stok produk
        // Ambil produk saat ini
        final product = await _database.getProductById(item.productId.value);
        if (product != null) {
          final newStock = product.stock - item.quantity.value;
          // TODO: Tambahkan validasi 'allowNegativeStock' dari settings
          await _database.updateProductStock(product.id, newStock);
        } else {
          // Jika produk tidak ada, batalkan transaksi
          throw Exception('Produk dengan ID ${item.productId.value} tidak ditemukan.');
        }
      }

      // 4. Update total hutang pelanggan
      await _database.updateCustomerDebt(customerId, newTotalDebt);
    });
  }

  // TODO: Tambahkan method untuk:
  // - createPayment (mencatat cicilan)
  // - updateTransactionStatus (lunas, batal, dll)
}
