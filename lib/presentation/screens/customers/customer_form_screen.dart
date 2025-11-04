import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../../../data/database/app_database.dart';
// ==== FIX: Lupa import provider ====
// Ini dibutuhkan agar screen tahu 'customerRepositoryProvider'.
import '../../providers/customer_provider.dart';
// ==== AKHIR FIX ====

class CustomerFormScreen extends ConsumerStatefulWidget {
  final String? customerId; // null = add mode, not null = edit mode

  const CustomerFormScreen({super.key, this.customerId});

  @override
  ConsumerState<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends ConsumerState<CustomerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _idCardController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();

  bool _isLoading = false;
  bool _isEditMode = false;
  CustomerData? _existingCustomer;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.customerId != null;
    if (_isEditMode) {
      _loadCustomerData();
    }
  }

  Future<void> _loadCustomerData() async {
    final repository = ref.read(customerRepositoryProvider);
    final customer = await repository.getCustomerById(widget.customerId!);

    if (customer != null) {
      setState(() {
        _existingCustomer = customer;
        _nameController.text = customer.name;
        _phoneController.text = customer.phone ?? '';
        _idCardController.text = customer.idCardNumber ?? '';
        _addressController.text = customer.address ?? '';
        _notesController.text = customer.notes ?? '';
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _idCardController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Pelanggan' : 'Tambah Pelanggan'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Customer Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Pelanggan *',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama pelanggan harus diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Phone Number
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'No. Handphone',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            // ID Card Number
            TextFormField(
              controller: _idCardController,
              decoration: const InputDecoration(
                labelText: 'No. KTP',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.badge),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Address
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // Notes
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Catatan',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.notes),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            // Save Button
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveCustomer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        _isEditMode ? 'Update Pelanggan' : 'Simpan Pelanggan',
                        style: const TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveCustomer() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      final repository = ref.read(customerRepositoryProvider);
      final name = _nameController.text.trim();
      final phone =
          _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim();
      final idCard = _idCardController.text.trim().isEmpty
          ? null
          : _idCardController.text.trim();
      final address = _addressController.text.trim().isEmpty
          ? null
          : _addressController.text.trim();
      final notes =
          _notesController.text.trim().isEmpty ? null : _notesController.text.trim();

      if (_isEditMode && _existingCustomer != null) {
        // Update existing customer
        final updatedCustomer = _existingCustomer!.copyWith(
          name: name,
          phone: Value(phone),
          idCardNumber: Value(idCard),
          address: Value(address),
          notes: Value(notes),
        );
        await repository.updateCustomer(updatedCustomer);
      } else {
        // Create new customer
        await repository.createCustomer(
          name: name,
          phone: phone,
          idCardNumber: idCard,
          address: address,
          notes: notes,
        );
      }

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditMode
                  ? 'Pelanggan berhasil diupdate'
                  : 'Pelanggan berhasil ditambahkan',
            ),
          ),
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
}

