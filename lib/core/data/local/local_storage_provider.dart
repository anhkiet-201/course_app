import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/core/data/local/local_storage.dart';

mixin LocalStorageProvider {
  LocalStorage get localStorage => injector.get();
}