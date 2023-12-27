import 'package:kt_course/core/data/local/hive_storage/local_storage.dart';
import 'package:kt_course/core/data/local/hive_storage/local_storage_provider.dart';
import 'package:kt_course/core/reactive/setting_value/repository/setting_value_repository.dart';

class SettingValueRepositoryImpl with LocalStorageProvider implements SettingValueRepository {
  @override
  T? get<T>(LocalStorageKey<T> key) {
    return localStorage.get(key);
  }

  @override
  Future<void> save<T>(LocalStorageKey<T> key, T? value) {
    if(value == null) {
      return localStorage.delete(key);
    }
    return localStorage.put(key, value);
  }
}