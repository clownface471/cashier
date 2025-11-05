import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../data/database/app_database.dart';
import '../../providers/payment_provider.dart';

class PaymentFormScreen extends ConsumerStatefulWidget {
  final TransactionData transaction;
  final CustomerData customer;

  const PaymentFormScreen({
    super.key,
    required this.transaction,
    required this.customer,
  });

  @override
  ConsumerState<PaymentFormScreen> createState() => _PaymentFormScreenState();
}

class _PaymentFormScreenState extends ConsumerState<PaymentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedPaymentMethod = 'cash';
  bool _isLoading = false;

  final List<String> _paymentMethods = [
    'cash',
    'transfer',
    'debit',
    'credit',
    'e-wallet',
  ];

  @override
  void initState() {
    super.initState();
    // Pre-fill dengan nilai cicilan bulanan
    _amountController.text = widget.transaction.monthlyInstallment.toStringAsFixed(0);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bayar Cicilan'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildSummaryCard(),
                  const SizedBox(height: 24),
                  _buildPaymentForm(),
                ],
              ),
            ),
      bottomNavigationBar: _buildSaveButton(),
    );
  }

  Widget _buildSummaryCard() {
    return Card(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Transaksi',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            _infoRow('Pelanggan', widget.customer.name),
            _infoRow('No. Invoice', widget.transaction.transactionNumber),
            const SizedBox(height: 8),
            _infoRow(
              'Total Hutang',
              CurrencyFormatter.format(widget.transaction.remainingDebt),
            ),
            _infoRow(
              'Cicilan per Bulan',
              CurrencyFormatter.format(widget.transaction.monthlyInstallment),
            ),
            _infoRow(
              'Sudah Bayar',
              '${widget.transaction.paidInstallments}/${widget.transaction.tenor} cicilan',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail Pembayaran',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),

        // Payment Amount
        TextFormField(
          controller: _amountController,
          decoration: InputDecoration(
            labelText: 'Jumlah Pembayaran *',
            prefixText: 'Rp ',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.attach_money),
            suffixIcon: IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                // Reset to monthly installment amount
                setState(() {
                  _amountController.text =
                      widget.transaction.monthlyInstallment.toStringAsFixed(0);
                });
              },
              tooltip: 'Reset ke cicilan bulanan',
            ),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Jumlah pembayaran harus diisi';
            }
            final amount = double.tryParse(value) ?? 0;
            if (amount <= 0) {
              return 'Jumlah harus lebih dari 0';
            }
            if (amount > widget.transaction.remainingDebt) {
              return 'Jumlah melebihi sisa hutang';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Payment Method
        DropdownButtonFormField<String>(
          value: _selectedPaymentMethod,
          decoration: const InputDecoration(
            labelText: 'Metode Pembayaran *',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.payment),
          ),
          items: _paymentMethods.map((method) {
            return DropdownMenuItem(
              value: method,
              child: Text(_getPaymentMethodLabel(method)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        const SizedBox(height: 16),

        // Notes
        TextFormField(
          controller: _notesController,
          decoration: const InputDecoration(
            labelText: 'Catatan (Opsional)',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.note),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 24),

        // Warning if payment less than monthly installment
        if (_amountController.text.isNotEmpty &&
            (double.tryParse(_amountController.text) ?? 0) <
                widget.transaction.monthlyInstallment)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange),
            ),
            child: Row(
              children: [
                Icon(Icons.warning, color: Colors.orange[700]),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Jumlah pembayaran kurang dari cicilan bulanan',
                    style: TextStyle(
                      color: Colors.orange[700],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.save),
        label: const Text('Simpan Pembayaran'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
        ),
        onPressed: _savePayment,
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600])),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  String _getPaymentMethodLabel(String method) {
    switch (method) {
      case 'cash':
        return 'Tunai';
      case 'transfer':
        return 'Transfer Bank';
      case 'debit':
        return 'Kartu Debit';
      case 'credit':
        return 'Kartu Kredit';
      case 'e-wallet':
        return 'E-Wallet';
      default:
        return method;
    }
  }

  Future<void> _savePayment() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Konfirmasi Pembayaran'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pelanggan: ${widget.customer.name}'),
            const SizedBox(height: 8),
            Text(
              'Jumlah: ${CurrencyFormatter.format(double.parse(_amountController.text))}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Metode: ${_getPaymentMethodLabel(_selectedPaymentMethod)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Konfirmasi'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isLoading = true);

    try {
      final repository = ref.read(paymentRepositoryProvider);
      final amount = double.parse(_amountController.text);
      final nextInstallmentNumber = widget.transaction.paidInstallments + 1;

      await repository.recordInstallmentPayment(
        transactionId: widget.transaction.id,
        customerId: widget.customer.id,
        userId: 'admin', // TODO: Replace with actual logged-in user
        amount: amount,
        paymentMethod: _selectedPaymentMethod,
        installmentNumber: nextInstallmentNumber,
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pembayaran berhasil dicatat!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context); // Go back to transaction detail
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menyimpan: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}