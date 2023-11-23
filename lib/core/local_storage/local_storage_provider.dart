import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/core/local_storage/local_storage.dart';

mixin LocalStorageProvider {
  LocalStorage get localStorage => injector.get();
}