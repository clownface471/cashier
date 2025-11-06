import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/product_repository.dart';
import 'database_provider.dart';

part 'product_provider.g.dart';

// Repository Provider
@riverpod
ProductRepository productRepository(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return ProductRepository(database);
}

// Watch all products (Stream)
@riverpod
Stream<List<ProductData>> productsStream(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.watchAllProducts();
}

// Get products as Future (for one-time fetch)
@riverpod
Future<List<ProductData>> products(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getAllProducts();
}

// Get active products only
@riverpod
Future<List<ProductData>> activeProducts(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getActiveProducts();
}

// Get low stock products
@riverpod
Future<List<ProductData>> lowStockProducts(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getLowStockProducts();
}

// Search products
@riverpod
Future<List<ProductData>> searchProducts(
  Ref ref,
  String query,
) {
  if (query.isEmpty) {
    return ref.watch(productRepositoryProvider).getAllProducts();
  }
  final repository = ref.watch(productRepositoryProvider);
  return repository.searchProducts(query);
}

// Get total stock value
@riverpod
Future<double> totalStockValue(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getTotalStockValue();
}
