import 'package:flutter/material.dart';
import 'products/products_screen.dart';
import 'customers/customers_screen.dart';
// ==== TAMBAHAN BARU: Import layar transaksi ====
import 'transactions/transactions_screen.dart';
// ==== AKHIR TAMBAHAN BARU ====

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // ==== FIX: Ganti placeholder dengan screen asli ====
  static const List<Widget> _screens = <Widget>[
    ProductsScreen(),
    CustomersScreen(),
    TransactionsScreen(), // <-- Sudah bukan placeholder lagi
    // TODO: Tambahkan layar Laporan di sini
    Scaffold(body: Center(child: Text('Laporan - Coming Soon'))),
    // TODO: Tambahkan layar Pengaturan di sini
    Scaffold(body: Center(child: Text('Pengaturan - Coming Soon'))),
  ];
  // ==== AKHIR FIX ====

  void _onItemTapped(int index) {
// ... (isi method tetap sama) ...
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
// ... (isi method tetap sama) ...
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Penting agar >3 item terlihat
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            activeIcon: Icon(Icons.inventory_2),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Pelanggan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale_outlined),
            activeIcon: Icon(Icons.point_of_sale),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_outlined),
            activeIcon: Icon(Icons.assessment),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}

