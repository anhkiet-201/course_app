import 'package:kt_course/core/base/repository/base_repository.dart';
import 'package:kt_course/core/data/local/hive_storage/local_storage.dart';

abstract interface class SettingValueRepository extends BaseRepository {
  Future<void> save<T>(LocalStorageKey<T> key, T value);
  T? get<T>(LocalStorageKey<T> key);
}