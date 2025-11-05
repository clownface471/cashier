import 'package:asverta/presentation/providers/transaction_provider.dart';
import 'package:asverta/presentation/screens/transactions/transaction_detail_screen.dart';
import 'package:asverta/presentation/screens/transactions/transaction_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:asverta/core/utils/currency_formatter.dart';
import 'package:asverta/data/database/app_database.dart';
import 'package:intl/intl.dart';

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final transactionsAsync = ref.watch(transactionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari nama pelanggan...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: transactionsAsync.when(
              data: (transactions) {
                final filteredList = transactions.where((item) {
                  final customerName = item.customer.name.toLowerCase();
                  return customerName.contains(_searchQuery.toLowerCase());
                }).toList();

                if (filteredList.isEmpty) {
                  return const Center(
                    child: Text(
                      'Belum ada transaksi',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    return _buildTransactionTile(context, item);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Gagal memuat transaksi: $e')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab-transaksi',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TransactionFormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTransactionTile(
      BuildContext context, TransactionWithCustomer item) {
    final tx = item.transaction;
    final customer = item.customer;
    final isCompleted = tx.status == 'completed';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
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