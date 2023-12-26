import 'package:hive_flutter/hive_flutter.dart';
import 'package:kt_course/core/data/local/hive_storage/local_storage.dart';

class LocalStorageImpl implements LocalStorage {
  @override
  Future delete(LocalStorageKey key) {
    return Hive.box(key.boxName).delete(key.key);
  }

  @override
  T? get<T>(LocalStorageKey<T> key) {
    return Hive.box(key.boxName).get(key.key);
  }

  @override
  List<T>? getList<T>(LocalStorageKey<List<T>> key) {
    return get<List<dynamic>>(LocalStorageKey(key.key))
        ?.cast<T>();
  }

  @override
  Future migrate() {
    // TODO: implement migrate
    throw UnimplementedError();
  }

  @override
  Future put<T>(LocalStorageKey<T> key, T value) {
    return Hive.box(key.boxName).put(key.key, value);
  }

  @override
  int get version => throw UnimplementedError();
}