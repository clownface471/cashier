import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';

part 'database_provider.g.dart';

/// Global Database Provider
/// This provides a single instance of AppDatabase throughout the app
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();

  // Ensure database is closed when provider is disposed
  ref.onDispose(() {
    database.close();
  });

  return database;
}
