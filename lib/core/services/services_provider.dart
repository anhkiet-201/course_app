import 'package:kt_course/core/data/network/services/api_service.dart';
import 'package:kt_course/core/di/Injector.dart';

mixin ApiServiceProvider on Object {
  ApiService get apiService => injector.get();
}