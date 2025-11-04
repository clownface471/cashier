import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/product_repository.dart';
import 'database_provider.dart';

part 'product_provider.g.dart';

// Repository Provider
@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return ProductRepository(database);
}

// Watch all products (Stream)
@riverpod
Stream<List<ProductData>> productsStream(ProductsStreamRef ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.watchAllProducts();
}

// Get products as Future (for one-time fetch)
@riverpod
Future<List<ProductData>> products(ProductsRef ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getAllProducts();
}

// Get active products only
@riverpod
Future<List<ProductData>> activeProducts(ActiveProductsRef ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getActiveProducts();
}

// Get low stock products
@riverpod
Future<List<ProductData>> lowStockProducts(LowStockProductsRef ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getLowStockProducts();
}

// Search products
@riverpod
Future<List<ProductData>> searchProducts(
  SearchProductsRef ref,
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
Future<double> totalStockValue(TotalStockValueRef ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getTotalStockValue();
}