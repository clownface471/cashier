import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../data/database/app_database.dart';
import '../../providers/database_provider.dart';
import '../../providers/payment_provider.dart';
import 'payment_form_screen.dart';

class TransactionDetailScreen extends ConsumerStatefulWidget {
  final String transactionId;

  const TransactionDetailScreen({
    super.key,
    required this.transactionId,
  });

  @override
  ConsumerState<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState
    extends ConsumerState<TransactionDetailScreen> {
  TransactionData? _transaction;
  CustomerData? _customer;
  List<TransactionItemData> _items = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTransactionData();
  }

  Future<void> _loadTransactionData() async {
    setState(() => _isLoading = true);
    try {
      final database = ref.read(appDatabaseProvider);

      // Load transaction
      final transaction = await database.getTransactionById(widget.transactionId);
      if (transaction == null) {
        throw Exception('Transaksi tidak ditemukan');
      }

      // Load customer
      final customer = await database.getCustomerById(transaction.customerId);

      // Load items
      final items = await database.getTransactionItems(widget.transactionId);

      setState(() {
        _transaction = transaction;
        _customer = customer;
        _items = items;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_transaction == null || _customer == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Transaksi')),
        body: const Center(child: Text('Transaksi tidak ditemukan')),
      );
    }

    final paymentsAsync = ref.watch(paymentsStreamProvider(widget.transactionId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Transaksi'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.receipt_long),
            onPressed: () {
              // TODO: Print receipt
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cetak Struk - Coming Soon')),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTransactionInfoCard(),
          const SizedBox(height: 16),
          _buildCustomerInfoCard(),
          const SizedBox(height: 16),
          _buildItemsCard(),
          const SizedBox(height: 16),
          _buildPaymentSummaryCard(),
          const SizedBox(height: 16),
          _buildPaymentHistoryCard(paymentsAsync),
        ],
      ),
      bottomNavigationBar: _transaction!.status != 'completed'
          ? _buildPaymentButton()
          : null,
    );
  }

  Widget _buildTransactionInfoCard() {
    return Card(
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
            _infoRow('No. Invoice', _transaction!.transactionNumber),
            _infoRow(
              'Tanggal',
              DateFormat('dd MMM yyyy, HH:mm').format(_transaction!.transactionDate),
            ),
            _infoRow('Status', _transaction!.status.toUpperCase(),
                valueColor: _getStatusColor()),
            if (_transaction!.nextPaymentDue != null &&
                _transaction!.status != 'completed')
              _infoRow(
                'Jatuh Tempo',
                DateFormat('dd MMM yyyy').format(_transaction!.nextPaymentDue!),
                valueColor: _isOverdue() ? Colors.red : null,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pelanggan',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            _infoRow('Nama', _customer!.name),
            if (_customer!.phone != null)
              _infoRow('No. HP', _customer!.phone!),
            if (_customer!.address != null)
              _infoRow('Alamat', _customer!.address!),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Produk (${_items.length})',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            ..._items.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.productName,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${item.quantity} x ${CurrencyFormatter.format(item.sellingPrice)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        CurrencyFormatter.format(item.subtotal),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummaryCard() {
    return Card(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ringkasan Pembayaran',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            _summaryRow('Subtotal', _transaction!.subtotal),
            _summaryRow('Uang Muka (DP)', _transaction!.downPayment),
            _summaryRow('Bunga (${_transaction!.interestRate}%)',
                _transaction!.interestAmount),
            _summaryRow('Biaya Admin', _transaction!.adminFee),
            const Divider(),
            _summaryRow('Total Yang Harus Dibayar', _transaction!.totalPayable,
                isBold: true),
            _summaryRow('Sudah Dibayar', _transaction!.totalPaid,
                valueColor: Colors.green),
            _summaryRow('Sisa Hutang', _transaction!.remainingDebt,
                valueColor: Colors.red, isBold: true),
            const Divider(),
            _infoRow('Tenor', '${_transaction!.tenor} bulan'),
            _infoRow(
              'Cicilan per Bulan',
              CurrencyFormatter.format(_transaction!.monthlyInstallment),
            ),
            _infoRow(
              'Progress',
              '${_transaction!.paidInstallments}/${_transaction!.tenor} cicilan',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentHistoryCard(AsyncValue<List<PaymentData>> paymentsAsync) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Riwayat Pembayaran',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            paymentsAsync.when(
              data: (payments) {
                if (payments.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text('Belum ada pembayaran')),
                  );
                }

                return Column(
                  children: payments.map((payment) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: Text('${payment.installmentNumber}'),
                      ),
                      title: Text(
                        CurrencyFormatter.format(payment.amount),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${DateFormat('dd MMM yyyy').format(payment.paymentDate)} - ${payment.paymentMethod}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: payment.status == 'completed'
                              ? Colors.green[100]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          payment.status.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: payment.status == 'completed'
                                ? Colors.green[700]
                                : Colors.grey[700],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Error: $e')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.payment),
        label: const Text('Bayar Cicilan'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentFormScreen(
                transaction: _transaction!,
                customer: _customer!,
              ),
            ),
          ).then((_) => _loadTransactionData()); // Refresh after payment
        },
      ),
    );
  }

  Widget _infoRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600])),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, double amount,
      {bool isBold = false, Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.grey[600],
            ),
          ),
          Text(
            CurrencyFormatter.format(amount),
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor() {
    switch (_transaction!.status) {
      case 'completed':
        return Colors.green;
      case 'overdue':
        return Colors.red;
      case 'active':
      default:
        return Colors.orange;
    }
  }

  bool _isOverdue() {
    if (_transaction!.nextPaymentDue == null) return false;
    return _transaction!.nextPaymentDue!.isBefore(DateTime.now());
  }
}