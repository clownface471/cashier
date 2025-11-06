import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/category_repository.dart';
import 'database_provider.dart';

part 'category_provider.g.dart';

// Repository Provider
@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return CategoryRepository(database);
}

// Watch all categories (Stream)
@riverpod
Stream<List<CategoryData>> categoriesStream(Ref ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.watchAllCategories();
}

// Get categories as Future
@riverpod
Future<List<CategoryData>> categories(Ref ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.getAllCategories();
}

// Get active categories only
@riverpod
Future<List<CategoryData>> activeCategories(Ref ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.getActiveCategories();
}
