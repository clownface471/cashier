import 'package:drift/drift.dart';
import '../database/app_database.dart';

/// Repository for Category CRUD operations
class CategoryRepository {
  final AppDatabase _database;

  CategoryRepository(this._database);

  // Get all categories
  Stream<List<CategoryData>> watchAllCategories() {
    return _database.select(_database.categories).watch();
  }

  Future<List<CategoryData>> getAllCategories() {
    return _database.getAllCategories();
  }

  Future<List<CategoryData>> getActiveCategories() {
    return (_database.select(_database.categories)
          ..where((c) => c.isActive.equals(true)))
        .get();
  }

  // Get category by ID
  Future<CategoryData?> getCategoryById(String id) {
    return (_database.select(_database.categories)
          ..where((c) => c.id.equals(id)))
        .getSingleOrNull();
  }

  // Create category
  Future<int> createCategory({
    required String name,
    String? description,
  }) {
    // ==== FIX ====
    // Kita panggil constructor default (CategoriesCompanion), BUKAN CategoriesCompanion.insert().
    // Ini agar 'id' menjadi 'Value.absent()' dan bisa ditangani oleh
    // logika auto-generate UUID di 'app_database.dart'.
    return _database.insertCategory(
      CategoriesCompanion(
        name: Value(name),
        description: Value(description),
      ),
    );
    // ==== AKHIR FIX ====
  }

  // Update category
  Future<bool> updateCategory(CategoryData category) {
    return (_database.update(_database.categories)
          ..where((c) => c.id.equals(category.id)))
        .replace(
      CategoriesCompanion(
        id: Value(category.id),
        name: Value(category.name),
        description: Value(category.description),
        isActive: Value(category.isActive),
        createdAt: Value(category.createdAt),
      ),
    );
  }

  // Delete category
  Future<int> deleteCategory(String id) {
    return (_database.delete(_database.categories)
          ..where((c) => c.id.equals(id)))
        .go();
  }
}
