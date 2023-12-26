import 'package:kt_course/core/data/local/hive_storage/local_storage.dart';

typedef Key<T> = LocalStorageKey<T>;
class LocalStorageKeyPredefined {
  const LocalStorageKeyPredefined._();

  /// Settings data
  static const themeMode = Key<int>('theme_mode');
}