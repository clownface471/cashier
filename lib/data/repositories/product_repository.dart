import 'package:drift/drift.dart';
import '../database/app_database.dart';

/// Repository for Product CRUD operations
class ProductRepository {
  final AppDatabase _database;

  ProductRepository(this._database);

  // Get all products
  Stream<List<ProductData>> watchAllProducts() {
    return _database.select(_database.products).watch();
  }

  Future<List<ProductData>> getAllProducts() {
    return _database.getAllProducts();
  }

  Future<List<ProductData>> getActiveProducts() {
    return _database.getActiveProducts();
  }

  // Get product by ID
  Future<ProductData?> getProductById(String id) {
    return _database.getProductById(id);
  }

  // Search products
  Future<List<ProductData>> searchProducts(String query) {
    final lowercaseQuery = query.toLowerCase();
    return (_database.select(_database.products)
          ..where((p) =>
              p.name.lower().like('%$lowercaseQuery%') |
              p.sku.lower().like('%$lowercaseQuery%') |
              p.barcode.lower().like('%$lowercaseQuery%')))
        .get();
  }

  // Get products by category
  Future<List<ProductData>> getProductsByCategory(String categoryId) {
    return (_database.select(_database.products)
          ..where((p) => p.categoryId.equals(categoryId)))
        .get();
  }

  // Get low stock products
  Future<List<ProductData>> getLowStockProducts() async {
    final allProducts = await getActiveProducts();
    return allProducts.where((p) => p.stock <= p.minStock).toList();
  }

  // Create product
  Future<int> createProduct({
    required String name,
    String? sku,
    String? barcode,
    required double costPrice,
    required double sellingPrice,
    int stock = 0,
    int minStock = 0,
    String? categoryId,
    String? description,
    String? imageUrl,
  }) {
    return _database.insertProduct(
      ProductsCompanion.insert(
        name: name,
        sku: Value(sku),
        barcode: Value(barcode),
        costPrice: Value(costPrice),
        sellingPrice: Value(sellingPrice),
        stock: Value(stock),
        minStock: Value(minStock),
        categoryId: Value(categoryId),
        description: Value(description),
        imageUrl: Value(imageUrl),
      ),
    );
  }

  // Update product
  Future<bool> updateProduct(ProductData product) {
    return _database.update(_database.products).replace(
      ProductsCompanion(
        id: Value(product.id),
        name: Value(product.name),
        sku: Value(product.sku),
        barcode: Value(product.barcode),
        costPrice: Value(product.costPrice),
        sellingPrice: Value(product.sellingPrice),
        stock: Value(product.stock),
        minStock: Value(product.minStock),
        categoryId: Value(product.categoryId),
        description: Value(product.description),
        imageUrl: Value(product.imageUrl),
        isActive: Value(product.isActive),
        createdAt: Value(product.createdAt),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // Update stock
  Future<int> updateStock(String productId, int newStock) {
    return _database.updateProductStock(productId, newStock);
  }

  // Soft delete (set isActive to false)
  Future<int> softDeleteProduct(String id) {
    return (_database.update(_database.products)..where((p) => p.id.equals(id)))
        .write(const ProductsCompanion(isActive: Value(false)));
  }

  // Hard delete
  Future<int> deleteProduct(String id) {
    return _database.deleteProduct(id);
  }

  // Get total product value (stock * cost price)
  Future<double> getTotalStockValue() async {
    final products = await getAllProducts();
    return products.fold<double>(
      0.0,
      (sum, product) => sum + (product.stock * product.costPrice),
    );
  }
}