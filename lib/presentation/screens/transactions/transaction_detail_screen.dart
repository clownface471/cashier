import 'package:asverta/core/utils/currency_formatter.dart';
import 'package:asverta/data/database/app_database.dart';
import 'package:asverta/presentation/providers/transaction_provider.dart';
import 'package:asverta/presentation/screens/transactions/payment_form_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionDetailScreen extends ConsumerWidget {
  final String transactionId;
  const TransactionDetailScreen({super.key, required this.transactionId});

  void _showPaymentModal(BuildContext context, WidgetRef ref, TransactionFullDetails details) {
    final transaction = details.transaction;
    
    if (transaction.status == 'completed') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transaksi ini sudah lunas')),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => PaymentFormModal(
        transactionId: transaction.id,
        customerId: details.customer.id,
        amountDue: transaction.monthlyInstallment,
        nextInstallmentNumber: transaction.paidInstallments + 1,
      ),
    ).then((success) {
      if (success == true) {
        ref.invalidate(transactionDetailsProvider(transactionId));
        ref.invalidate(paymentsForTransactionProvider(transactionId));
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(transactionDetailsProvider(transactionId));
    final paymentsAsync = ref.watch(paymentsForTransactionProvider(transactionId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Transaksi'),
      ),
      body: detailsAsync.when(
        data: (details) {
          final tx = details.transaction;
          final customer = details.customer;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildCustomerCard(context, customer),
              const SizedBox(height: 16),
              _buildSummaryCard(context, tx),
              const SizedBox(height: 16),
              _buildItemsCard(context, details.items),
              const SizedBox(height: 16),
              _buildPaymentHistory(context, paymentsAsync),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: detailsAsync.maybeWhen(
        data: (details) => details.transaction.status != 'completed' ? FloatingActionButton.extended(
          onPressed: () => _showPaymentModal(context, ref, details),
          icon: const Icon(Icons.payment),
          label: const Text('Bayar Cicilan'),
        ) : null,
        orElse: () => null,
      ),
    );
  }

  Widget _buildCustomerCard(BuildContext context, CustomerData customer) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
        ),
        title: Text(customer.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(customer.phone ?? 'No. HP tidak ada'),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, TransactionData tx) {
    final bool isCompleted = tx.status == 'completed';
    return Card(
      color: Colors.blueGrey[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ringkasan Hutang',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSummaryRow('Status', tx.status.toUpperCase(), 
              valueColor: isCompleted ? Colors.green : Colors.orange,
            ),
            _buildSummaryRow('Sisa Hutang', CurrencyFormatter.format(tx.remainingDebt)),
            _buildSummaryRow('Total Tagihan', CurrencyFormatter.format(tx.totalPayable)),
            _buildSummaryRow('Total Dibayar', CurrencyFormatter.format(tx.totalPaid)),
            const Divider(height: 24),
            _buildSummaryRow('Cicilan per Bulan', CurrencyFormatter.format(tx.monthlyInstallment)),
            _buildSummaryRow('Cicilan Terbayar', '${tx.paidInstallments} / ${tx.tenor} bulan'),
            _buildSummaryRow('Jatuh Tempo Berikutnya', 
              tx.nextPaymentDue != null ? '${tx.nextPaymentDue!.day}/${tx.nextPaymentDue!.month}/${tx.nextPaymentDue!.year}' : (isCompleted ? '-' : 'N/A')
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsCard(BuildContext context, List<TransactionItemData> items) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Barang',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...items.map((item) {
              return ListTile(
                title: Text(item.productName),
                subtitle: Text('${item.quantity}x @ ${CurrencyFormatter.format(item.sellingPrice)}'),
                trailing: Text(CurrencyFormatter.format(item.subtotal)),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentHistory(BuildContext context, AsyncValue<List<PaymentData>> paymentsAsync) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Riwayat Pembayaran',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        paymentsAsync.when(
          data: (payments) {
            if (payments.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: Text('Belum ada pembayaran cicilan')),
                ),
              );
            }
            return Card(
              child: ListView.separated(
                itemCount: payments.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final payment = payments[index];
                  bool isDP = payment.paymentType == 'down_payment';
                  return ListTile(
                    title: Text(
                      isDP ? 'Uang Muka (DP)' : 'Cicilan ke-${payment.installmentNumber}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${payment.paymentDate.day}/${payment.paymentDate.month}/${payment.paymentDate.year} • ${payment.paymentMethod}',
                    ),
                    trailing: Text(
                      CurrencyFormatter.format(payment.amount),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(height: 1, indent: 16, endIndent: 16),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Center(child: Text('Error: $e')),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[700])),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}