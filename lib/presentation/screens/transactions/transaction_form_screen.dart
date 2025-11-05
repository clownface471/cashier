import 'package:asverta/presentation/providers/customer_provider.dart';
import 'package:asverta/presentation/providers/product_provider.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:asverta/data/database/app_database.dart';
import 'package:asverta/core/utils/currency_formatter.dart';
import 'package:asverta/presentation/providers/transaction_provider.dart';

class TransactionFormScreen extends ConsumerStatefulWidget {
  const TransactionFormScreen({super.key});

  @override
  ConsumerState<TransactionFormScreen> createState() =>
      _TransactionFormScreenState();
}

class _TransactionFormScreenState extends ConsumerState<TransactionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  CustomerData? _selectedCustomer;
  final List<TransactionItemsCompanion> _cart = [];
  final Map<String, int> _productStockCache = {};

  final _downPaymentController = TextEditingController(text: '0');
  final _tenorController = TextEditingController(text: '1');
  final _interestRateController = TextEditingController(text: '0');
  final _adminFeeController = TextEditingController(text: '0');

  double _subtotal = 0;
  double _totalPayable = 0;
  double _remainingDebt = 0;
  double _monthlyInstallment = 0;
  double _interestAmount = 0;

  @override
  void initState() {
    super.initState();
    _downPaymentController.addListener(_calculateTotals);
    _tenorController.addListener(_calculateTotals);
    _interestRateController.addListener(_calculateTotals);
    _adminFeeController.addListener(_calculateTotals);
  }

  @override
  void dispose() {
    _downPaymentController.removeListener(_calculateTotals);
    _tenorController.removeListener(_calculateTotals);
    _interestRateController.removeListener(_calculateTotals);
    _adminFeeController.removeListener(_calculateTotals);

    _downPaymentController.dispose();
    _tenorController.dispose();
    _interestRateController.dispose();
    _adminFeeController.dispose();
    super.dispose();
  }

  void _calculateTotals() {
    setState(() {
      final subtotal = _subtotal;
      final dp = double.tryParse(_downPaymentController.text) ?? 0;
      final adminFee = double.tryParse(_adminFeeController.text) ?? 0;
      final tenor = int.tryParse(_tenorController.text) ?? 1;
      final interestRate = double.tryParse(_interestRateController.text) ?? 0;

      final remainingAmount = subtotal - dp;
      
      if (interestRate > 0) {
        _interestAmount = (remainingAmount * (interestRate / 100)) * tenor;
      } else {
        _interestAmount = 0;
      }
      
      _totalPayable = subtotal + _interestAmount + adminFee;
      _remainingDebt = _totalPayable - dp;
      _monthlyInstallment = (tenor > 0) ? _remainingDebt / tenor : 0;
    });
  }

  void _onSelectCustomerPressed() async {
    final customersAsync = ref.read(activeCustomersProvider);
    customersAsync.when(
      data: (customers) {
        showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return ListView.builder(
              itemCount: customers.length,
              itemBuilder: (ctx, index) {
                final customer = customers[index];
                return ListTile(
                  title: Text(customer.name),
                  subtitle: Text(customer.phone ?? 'No. HP tidak ada'),
                  onTap: () {
                    setState(() {
                      _selectedCustomer = customer;
                    });
                    Navigator.pop(ctx);
                  },
                );
              },
            );
          },
        );
      },
      loading: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Memuat pelanggan...'))
      ),
      error: (e, s) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e'))
      ),
    );
  }

  void _onAddProductPressed() async {
    try {
      final products = await ref.read(activeProductsProvider.future);
      if (!mounted) return;
      
      showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (ctx, index) {
              final product = products[index];
              final cartItem = _cart.where((item) => item.productId.value == product.id).firstOrNull;
              final remainingStock = (_productStockCache[product.id] ?? product.stock) - (cartItem?.quantity.value ?? 0);
              final bool canAdd = remainingStock > 0;
              
              return ListTile(
                title: Text(product.name),
                subtitle: Text('Stok: $remainingStock | ${CurrencyFormatter.format(product.sellingPrice)}'),
                trailing: canAdd ? const Icon(Icons.add_shopping_cart) : const Text('Habis', style: TextStyle(color: Colors.red)),
                onTap: canAdd ? () {
                  _addToCart(product);
                  Navigator.pop(ctx);
                } : null,
              );
            },
          );
        },
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat produk: $e'))
      );
    }
  }

  void _addToCart(ProductData product) {
    setState(() {
      _productStockCache.putIfAbsent(product.id, () => product.stock);
      
      final existingItemIndex = _cart.indexWhere((item) => item.productId.value == product.id);

      if (existingItemIndex != -1) {
        final existingItem = _cart[existingItemIndex];
        final currentQty = existingItem.quantity.value;
        
        if (currentQty < _productStockCache[product.id]!) {
          _cart[existingItemIndex] = existingItem.copyWith(
            quantity: Value(currentQty + 1),
            subtotal: Value((currentQty + 1) * product.sellingPrice),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Stok produk tidak mencukupi')),
          );
        }
      } else {
        _cart.add(
          TransactionItemsCompanion(
            productId: Value(product.id),
            productName: Value(product.name),
            costPrice: Value(product.costPrice),
            sellingPrice: Value(product.sellingPrice),
            quantity: const Value(1),
            subtotal: Value(product.sellingPrice),
          ),
        );
      }
      _recalculateCartSubtotal();
    });
  }

  void _recalculateCartSubtotal() {
    _subtotal = _cart.fold(0.0, (sum, item) => sum + item.subtotal.value);
    _calculateTotals();
  }

  void _updateCartItemQuantity(int index, int newQuantity) {
    setState(() {
      final item = _cart[index];
      final productId = item.productId.value;
      final productStock = _productStockCache[productId]!;
      
      if (newQuantity <= 0) {
        _cart.removeAt(index);
      } else if (newQuantity > productStock) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Stok produk tidak mencukupi')),
        );
        _cart[index] = item.copyWith(
          quantity: Value(productStock),
          subtotal: Value(productStock * item.sellingPrice.value),
        );
      } else {
        _cart[index] = item.copyWith(
          quantity: Value(newQuantity),
          subtotal: Value(newQuantity * item.sellingPrice.value),
        );
      }
      _recalculateCartSubtotal();
    });
  }

  Widget _buildCartList() {
    if (_cart.isEmpty) {
      return const Center(
        child: Text('Keranjang masih kosong. Tekan "Tambah Produk".'),
      );
    }
    return ListView.builder(
      itemCount: _cart.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = _cart[index];
        final qty = item.quantity.value;
        
        return ListTile(
          title: Text(item.productName.value),
          subtitle: Text(CurrencyFormatter.format(item.sellingPrice.value)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => _updateCartItemQuantity(index, qty - 1),
              ),
              Text('$qty', style: const TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _updateCartItemQuantity(index, qty + 1),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _saveTransaction() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (_selectedCustomer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pelanggan harus dipilih')),
      );
      return;
    }
    if (_cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Keranjang tidak boleh kosong')),
      );
      return;
    }
    
    setState(() => _isLoading = true);
    
    try {
      final repository = ref.read(transactionRepositoryProvider);
      
      final dp = double.tryParse(_downPaymentController.text) ?? 0;
      final tenor = int.tryParse(_tenorController.text) ?? 1;
      
      final now = DateTime.now();
      final firstPaymentDate = DateTime(now.year, now.month + 1, now.day);
      final nextPaymentDue = firstPaymentDate;

      await repository.createCreditTransaction(
        customerId: _selectedCustomer!.id,
        userId: 'admin',
        items: _cart,
        subtotal: _subtotal,
        downPayment: dp,
        downPaymentMethod: 'cash',
        remainingAmount: _subtotal - dp,
        tenor: tenor,
        interestRate: double.tryParse(_interestRateController.text) ?? 0,
        interestAmount: _interestAmount,
        adminFee: double.tryParse(_adminFeeController.text) ?? 0,
        monthlyInstallment: _monthlyInstallment,
        totalPayable: _totalPayable,
        firstPaymentDate: firstPaymentDate,
        nextPaymentDue: nextPaymentDue,
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transaksi berhasil disimpan')),
        );
      }
      
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menyimpan transaksi: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi Baru'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildCustomerSection(),
            const SizedBox(height: 16),
            _buildCartSection(),
            const SizedBox(height: 16),
            _buildPricingSection(),
            const SizedBox(height: 16),
            _buildSummarySection(),
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveTransaction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Simpan Transaksi',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerSection() {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListTile(
          leading: const Icon(Icons.person, size: 36),
          title: Text(
            _selectedCustomer?.name ?? 'Pilih Pelanggan',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(_selectedCustomer?.phone ?? 'Belum ada pelanggan dipilih'),
          trailing: const Icon(Icons.chevron_right),
          onTap: _onSelectCustomerPressed,
        ),
      ),
    );
  }

  Widget _buildCartSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Keranjang',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 1,
          child: Column(
            children: [
              _buildCartList(),
              const Divider(height: 1),
              ListTile(
                title: const Text('Tambah Produk'),
                leading: const Icon(Icons.add_shopping_cart),
                onTap: _onAddProductPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPricingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail Pembayaran',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _downPaymentController,
                  decoration: const InputDecoration(
                    labelText: 'Uang Muka (DP)',
                    prefixText: 'Rp ',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.money),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _tenorController,
                        decoration: const InputDecoration(
                          labelText: 'Tenor (Bulan)',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        validator: (value) {
                          if (value == null || value.isEmpty || int.tryParse(value) == null || int.parse(value) < 1) {
                            return 'Min. 1';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _interestRateController,
                        decoration: const InputDecoration(
                          labelText: 'Bunga (% / Bln)',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.percent),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.admin_panel_settings),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummarySection() {
    return Card(
      elevation: 1,
      color: Colors.blueGrey[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSummaryRow('Subtotal Keranjang', CurrencyFormatter.format(_subtotal)),
            _buildSummaryRow('Biaya Admin', CurrencyFormatter.format(double.tryParse(_adminFeeController.text) ?? 0)),
            _buildSummaryRow('Total Bunga (${_interestRateController.text}%)', CurrencyFormatter.format(_interestAmount)),
            const Divider(height: 20),
            _buildSummaryRow('Total Tagihan', CurrencyFormatter.format(_totalPayable), isBold: true),
            _buildSummaryRow('Uang Muka (DP)', CurrencyFormatter.format(double.tryParse(_downPaymentController.text) ?? 0)),
            const Divider(height: 20),
            _buildSummaryRow('Sisa Hutang', CurrencyFormatter.format(_remainingDebt), isBold: true),
            const SizedBox(height: 12),
            _buildSummaryRow('Cicilan / Bulan', CurrencyFormatter.format(_monthlyInstallment), isBold: true, isLarge: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isBold = false, bool isLarge = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isLarge ? 16 : 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isLarge ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: isLarge ? Theme.of(context).colorScheme.primary : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}