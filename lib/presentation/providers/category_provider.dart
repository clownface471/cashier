import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/category_repository.dart';
import 'database_provider.dart';

part 'category_provider.g.dart';

// Repository Provider
@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return CategoryRepository(database);
}

// Watch all categories (Stream)
@riverpod
Stream<List<CategoryData>> categoriesStream(CategoriesStreamRef ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.watchAllCategories();
}

// Get categories as Future
@riverpod
Future<List<CategoryData>> categories(CategoriesRef ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.getAllCategories();
}

// Get active categories only
@riverpod
Future<List<CategoryData>> activeCategories(ActiveCategoriesRef ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.getActiveCategories();
}