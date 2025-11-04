import 'package:asverta/presentation/providers/customer_provider.dart';
import 'package:asverta/presentation/providers/product_provider.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../data/database/app_database.dart';
import '../../providers/transaction_provider.dart';

// Model sederhana untuk menampung item di keranjang
class CartItem {
  final ProductData product;
  int quantity;
  CartItem({required this.product, this.quantity = 1});
}

class TransactionFormScreen extends ConsumerStatefulWidget {
  const TransactionFormScreen({super.key});

  @override
  ConsumerState<TransactionFormScreen> createState() =>
      _TransactionFormScreenState();
}

class _TransactionFormScreenState extends ConsumerState<TransactionFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // State untuk form
  CustomerData? _selectedCustomer;
  final List<CartItem> _cart = [];
  final _dpController = TextEditingController(text: '0');
  final _tenorController = TextEditingController(text: '1'); // Default 1 bulan
  final _bungaController = TextEditingController(text: '0');
  final _adminFeeController = TextEditingController(text: '0');

  double _subtotal = 0;
  double _totalPayable = 0;
  double _remainingDebt = 0;
  double _monthlyInstallment = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Tambahkan listener untuk kalkulasi otomatis
    _dpController.addListener(_calculateTotals);
    _tenorController.addListener(_calculateTotals);
    _bungaController.addListener(_calculateTotals);
    _adminFeeController.addListener(_calculateTotals);
  }

  @override
  void dispose() {
    _dpController.dispose();
    _tenorController.dispose();
    _bungaController.dispose();
    _adminFeeController.dispose();
    super.dispose();
  }

  // Fungsi inti untuk menghitung semua angka kredit
  void _calculateTotals() {
    if (mounted) {
      setState(() {
        _subtotal = _cart.fold(
            0,
            (sum, item) =>
                sum + (item.product.sellingPrice * item.quantity));

        final dp = double.tryParse(_dpController.text) ?? 0;
        final tenor = int.tryParse(_tenorController.text) ?? 1;
        final bungaPersen = double.tryParse(_bungaController.text) ?? 0;
        final adminFee = double.tryParse(_adminFeeController.text) ?? 0;

        final sisaPokok = _subtotal - dp;
        final totalBunga = (sisaPokok * (bungaPersen / 100)) * tenor;
        
        _totalPayable = sisaPokok + totalBunga + adminFee;
        _remainingDebt = _totalPayable; // Saat baru dibuat, sisa hutang = total
        _monthlyInstallment = tenor > 0 ? _totalPayable / tenor : 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Kita butuh daftar pelanggan dan produk
    final customersAsync = ref.watch(activeCustomersProvider);
    final productsAsync = ref.watch(activeProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi Baru'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildCustomerSelector(customersAsync),
                  const SizedBox(height: 24),
                  _buildCartSection(productsAsync),
                  const SizedBox(height: 24),
                  _buildCreditSection(),
                  const SizedBox(height: 24),
                  _buildSummarySection(),
                ],
              ),
            ),
      bottomNavigationBar: _buildSaveButton(),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildCustomerSelector(AsyncValue<List<CustomerData>> customersAsync) {
    return customersAsync.when(
      data: (customers) => DropdownButtonFormField<CustomerData>(
        value: _selectedCustomer,
        hint: const Text('Pilih Pelanggan *'),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(),
        ),
        isExpanded: true,
        items: customers.map((customer) {
          return DropdownMenuItem(
            value: customer,
            child: Text(customer.name),
          );
        }).toList(),
        onChanged: (customer) {
          setState(() {
            _selectedCustomer = customer;
          });
        },
        validator: (value) =>
            value == null ? 'Pelanggan harus dipilih' : null,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Text('Gagal memuat pelanggan: $e'),
    );
  }

  Widget _buildCartSection(AsyncValue<List<ProductData>> productsAsync) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Keranjang (${_cart.length})',
                style: Theme.of(context).textTheme.titleMedium),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () => _showProductPicker(productsAsync),
            ),
          ],
        ),
        const Divider(),
        if (_cart.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Keranjang masih kosong'),
            ),
          ),
        ..._cart.map((item) => ListTile(
              title: Text(item.product.name),
              subtitle: Text(
                  '${item.quantity} x ${CurrencyFormatter.format(item.product.sellingPrice)}'),
              trailing: Text(
                CurrencyFormatter.format(
                    item.product.sellingPrice * item.quantity),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () => _showEditCartItemDialog(item),
            )),
      ],
    );
  }

  Widget _buildCreditSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pengaturan Kredit',
            style: Theme.of(context).textTheme.titleMedium),
        const Divider(),
        const SizedBox(height: 16),
        TextFormField(
          controller: _dpController,
          decoration: const InputDecoration(
            labelText: 'Uang Muka (DP)',
            prefixText: 'Rp ',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _tenorController,
                decoration: const InputDecoration(
                  labelText: 'Tenor (Bulan)',
                  suffixText: 'bulan',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      (int.tryParse(value) ?? 0) <= 0) {
                    return 'Min. 1';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: _bungaController,
                decoration: const InputDecoration(
                  labelText: 'Bunga per Bulan',
                  suffixText: '%',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
         TextFormField(
          controller: _adminFeeController,
          decoration: const InputDecoration(
            labelText: 'Biaya Admin',
            prefixText: 'Rp ',
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildSummarySection() {
    return Card(
      color: Colors.blueGrey[50],
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _summaryRow('Subtotal', CurrencyFormatter.format(_subtotal)),
            _summaryRow('Sisa Hutang Pokok', CurrencyFormatter.format(_subtotal - (double.tryParse(_dpController.text) ?? 0))),
            _summaryRow('Total (Termasuk Bunga & Admin)', CurrencyFormatter.format(_totalPayable)),
            const Divider(height: 24),
            _summaryRow(
              'Cicilan per Bulan',
              CurrencyFormatter.format(_monthlyInstallment),
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String title, String amount, {bool isTotal = false}) {
    final style = isTotal
        ? Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold)
        : Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: style),
          Text(amount, style: style),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.save),
        label: const Text('Simpan Transaksi'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
        ),
        onPressed: _saveTransaction,
      ),
    );
  }

  // --- LOGIC FUNCTIONS ---

  void _showProductPicker(AsyncValue<List<ProductData>> productsAsync) {
    productsAsync.when(
      data: (products) {
        showModalBottomSheet(
          context: context,
          builder: (ctx) => ListView.builder(
            itemCount: products.length,
            itemBuilder: (ctx, index) {
              final product = products[index];
              final inCart = _cart.any((item) => item.product.id == product.id);
              return ListTile(
                title: Text(product.name),
                subtitle: Text(CurrencyFormatter.format(product.sellingPrice)),
                trailing:
                    inCart ? const Icon(Icons.check, color: Colors.green) : null,
                onTap: () {
                  if (!inCart) {
                    setState(() {
                      _cart.add(CartItem(product: product, quantity: 1));
                      _calculateTotals();
                    });
                  }
                  Navigator.pop(ctx);
                },
              );
            },
          ),
        );
      },
      loading: () =>
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Memuat produk...'),
      )),
      error: (e, s) =>
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Gagal memuat produk: $e'),
        backgroundColor: Colors.red,
      )),
    );
  }

  void _showEditCartItemDialog(CartItem item) {
    final qtyController = TextEditingController(text: item.quantity.toString());
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(item.product.name),
        content: TextField(
          controller: qtyController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Jumlah'),
        ),
        actions: [
          TextButton(
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
            onPressed: () {
              setState(() {
                _cart.remove(item);
                _calculateTotals();
              });
              Navigator.pop(ctx);
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              setState(() {
                item.quantity = int.tryParse(qtyController.text) ?? 1;
                _calculateTotals();
              });
              Navigator.pop(ctx);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _saveTransaction() async {
    if (!_formKey.currentState!.validate() || _selectedCustomer == null || _cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Harap pilih pelanggan dan tambahkan minimal 1 produk.'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final repo = ref.read(transactionRepositoryProvider);
      final customer = _selectedCustomer!;
      final tenor = int.tryParse(_tenorController.text) ?? 1;

      // 1. Siapkan data transaksi utama
      final transactionData = TransactionsCompanion(
        transactionNumber: Value('TX-${DateTime.now().millisecondsSinceEpoch}'), // Nomor invoice simpel
        customerId: Value(customer.id),
        userId: const Value('admin'), // TODO: Ganti dengan user yg login
        type: const Value('credit'),
        subtotal: Value(_subtotal),
        downPayment: Value(double.tryParse(_dpController.text) ?? 0),
        remainingAmount: Value(_totalPayable), // Sisa yg harus dicicil
        tenor: Value(tenor),
        interestRate: Value(double.tryParse(_bungaController.text) ?? 0),
        interestAmount: Value(_totalPayable - (_subtotal - (double.tryParse(_dpController.text) ?? 0)) - (double.tryParse(_adminFeeController.text) ?? 0)), // Bunga = Total - Pokok - Admin
        adminFee: Value(double.tryParse(_adminFeeController.text) ?? 0),
        monthlyInstallment: Value(_monthlyInstallment),
        totalPayable: Value(_totalPayable),
        totalPaid: const Value(0), // Awalnya 0, DP tidak dihitung sebagai cicilan
        remainingDebt: Value(_remainingDebt),
        paidInstallments: const Value(0),
        remainingInstallments: Value(tenor),
        status: const Value('active'), // 'active' atau 'completed' jika lunas
        transactionDate: Value(DateTime.now()),
        // TODO: Hitung tanggal jatuh tempo pertama
        // firstPaymentDate: Value(DateTime.now().add(const Duration(days: 30))),
      );

      // 2. Siapkan data item-item keranjang
      final List<TransactionItemsCompanion> itemsData = _cart.map((item) {
        return TransactionItemsCompanion(
          productId: Value(item.product.id),
          productName: Value(item.product.name),
          costPrice: Value(item.product.costPrice),
          sellingPrice: Value(item.product.sellingPrice),
          quantity: Value(item.quantity),
          subtotal: Value(item.product.sellingPrice * item.quantity),
        );
      }).toList();

      // 3. Hitung total hutang baru pelanggan
      final newTotalDebt = customer.totalDebt + _remainingDebt;

      // 4. Panggil repository
      await repo.createCreditTransaction(
        transactionData: transactionData,
        items: itemsData,
        customerId: customer.id,
        newTotalDebt: newTotalDebt,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Transaksi berhasil disimpan!'),
          backgroundColor: Colors.green,
        ));
        Navigator.pop(context); // Kembali ke daftar transaksi
      }
    } catch (e) {
       if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Gagal menyimpan: $e'),
          backgroundColor: Colors.red,
        ));
      }
    } finally {
       if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
