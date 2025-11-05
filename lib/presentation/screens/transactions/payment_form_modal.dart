import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:asverta/presentation/providers/transaction_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentFormModal extends ConsumerStatefulWidget {
  final String transactionId;
  final String customerId;
  final double amountDue;
  final int nextInstallmentNumber;

  const PaymentFormModal({
    super.key,
    required this.transactionId,
    required this.customerId,
    required this.amountDue,
    required this.nextInstallmentNumber,
  });

  @override
  ConsumerState<PaymentFormModal> createState() => _PaymentFormModalState();
}

class _PaymentFormModalState extends ConsumerState<PaymentFormModal> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  String? _selectedPaymentMethod = 'Cash';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.amountDue.toStringAsFixed(0);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _savePayment() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      final repository = ref.read(transactionRepositoryProvider);
      final amount = double.parse(_amountController.text);

      await repository.createPayment(
        transactionId: widget.transactionId,
        customerId: widget.customerId,
        userId: 'admin',
        amount: amount,
        paymentMethod: _selectedPaymentMethod ?? 'Cash',
        installmentNumber: widget.nextInstallmentNumber,
        notes: _notesController.text,
      );

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pembayaran berhasil disimpan')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
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
    return Padding(
      padding: EdgeInsets.fromLTRB(
          16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bayar Cicilan ke-${widget.nextInstallmentNumber}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Jumlah Bayar',
                prefixText: 'Rp ',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Jumlah harus diisi';
                }
                if (double.tryParse(value) == null) {
                  return 'Format angka salah';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedPaymentMethod,
              decoration: const InputDecoration(
                labelText: 'Metode Bayar',
                border: OutlineInputBorder(),
              ),
              items: ['Cash', 'Transfer', 'Debit', 'Lainnya']
                  .map((method) => DropdownMenuItem(
                        value: method,
                        child: Text(method),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Catatan (Opsional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _savePayment,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Simpan Pembayaran'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}