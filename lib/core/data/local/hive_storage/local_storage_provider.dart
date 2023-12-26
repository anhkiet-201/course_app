import 'package:kt_course/core/data/local/hive_storage/local_storage.dart';
import 'package:kt_course/core/di/Injector.dart';

mixin LocalStorageProvider {
  LocalStorage get localStorage => injector.get();
}