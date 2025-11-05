// [BUAT FILE BARU INI]
// (Anda bisa letakkan di 'lib/presentation/models' atau 'lib/presentation/screens/reports')

// Enum ini mendefinisikan tipe-tipe laporan
// yang bisa dipilih pengguna di UI
enum ReportFilterType {
  transaction,
  payment,
  productSold,
  stock,
  category,
  expense,
  perCashier,
  paymentMethod,
}

// Anda juga bisa menambahkan class lain di sini jika diperlukan
// untuk state management UI laporan.