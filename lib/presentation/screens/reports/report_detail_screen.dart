import 'package:asverta/core/utils/currency_formatter.dart';
import 'package:asverta/data/database/app_database.dart';
import 'package:asverta/presentation/providers/transaction_provider.dart';
import 'package:asverta/presentation/screens/transactions/transaction_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:asverta/presentation/models/report_models.dart';

class ReportDetailScreen extends ConsumerWidget {
  final String title;
  final ReportFilterType filterType;

  const ReportDetailScreen({
    super.key,
    required this.title,
    required this.filterType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(filteredTransactionsProvider(filterType));

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: transactionsAsync.when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return const Center(
              child: Text(
                'Tidak ada data untuk laporan ini.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final item = transactions[index];
              return _buildTransactionTile(context, item);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Gagal memuat data: $e')),
      ),
    );
  }

  Widget _buildTransactionTile(
      BuildContext context, TransactionWithCustomer item) {
    final tx = item.transaction;
    final customer = item.customer;
    final isCompleted = tx.status == 'completed';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCompleted
              ? Colors.green.shade100
              : Colors.orange.shade100,
          child: Icon(
            isCompleted ? Icons.check : Icons.hourglass_bottom,
            color: isCompleted ? Colors.green.shade800 : Colors.orange.shade800,
          ),
        ),
        title: Text(
          customer.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat('dd MMM yyyy').format(tx.transactionDate),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              CurrencyFormatter.format(tx.totalPayable),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Sisa: ${CurrencyFormatter.format(tx.remainingDebt)}',
              style: TextStyle(
                fontSize: 12,
                color: isCompleted ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionDetailScreen(
                transactionId: tx.id,
              ),
            ),
          );
        },
      ),
    );
  }
}