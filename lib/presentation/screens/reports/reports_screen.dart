import 'package:asverta/core/utils/currency_formatter.dart';
import 'package:asverta/data/database/app_database.dart';
import 'package:asverta/presentation/providers/transaction_provider.dart';
import 'package:asverta/presentation/screens/reports/report_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:asverta/data/models/transaction_models.dart';
import 'package:asverta/presentation/models/report_models.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  void _navigateToDetail(
      BuildContext context, String title, ReportFilterType filter) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportDetailScreen(
          title: title,
          filterType: filter,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(dashboardStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan & Dashboard'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardStatsProvider);
        },
        child: statsAsync.when(
          data: (stats) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildStatGrid(context, stats),
                const SizedBox(height: 24),
                _buildReportList(context),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Center(
            child: Text('Gagal memuat statistik: $e'),
          ),
        ),
      ),
    );
  }

  Widget _buildStatGrid(BuildContext context, DashboardStats stats) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _buildStatCard(
          context: context,
          title: 'Total Piutang',
          value: CurrencyFormatter.format(stats.totalReceivables),
          icon: Icons.account_balance_wallet,
          color: Colors.orange,
          onTap: () => _navigateToDetail(
            context,
            'Daftar Piutang',
            ReportFilterType.allReceivables,
          ),
        ),
        _buildStatCard(
          context: context,
          title: 'Penjualan Hari Ini',
          value: CurrencyFormatter.format(stats.totalSalesToday),
          icon: Icons.trending_up,
          color: Colors.green,
          onTap: () => _navigateToDetail(
            context,
            'Penjualan Hari Ini',
            ReportFilterType.salesToday,
          ),
        ),
        _buildStatCard(
          context: context,
          title: 'Transaksi Hari Ini',
          value: stats.transactionsToday.toString(),
          icon: Icons.receipt_long,
          color: Colors.blue,
          onTap: () => _navigateToDetail(
            context,
            'Transaksi Hari Ini',
            ReportFilterType.salesToday,
          ),
        ),
        _buildStatCard(
          context: context,
          title: 'Pelanggan Baru (Bln)',
          value: stats.newCustomersThisMonth.toString(),
          icon: Icons.person_add,
          color: Colors.teal,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 32, color: color),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Laporan Rinci',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 1,
          child: Column(
            children: [
              _buildReportTile(
                context: context,
                title: 'Laporan Penjualan Bulan Ini',
                icon: Icons.calendar_month,
                onTap: () => _navigateToDetail(
                  context,
                  'Penjualan Bulan Ini',
                  ReportFilterType.salesThisMonth,
                ),
              ),
              _buildReportTile(
                context: context,
                title: 'Laporan Stok Produk',
                icon: Icons.inventory_2,
                onTap: () {},
              ),
              _buildReportTile(
                context: context,
                title: 'Laporan Pengeluaran',
                icon: Icons.arrow_circle_down,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReportTile({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}