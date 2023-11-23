import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/core/network/services/api_service.dart';
import 'package:kt_course/core/network/services/app_service.dart';

mixin AppServiceProvider on Object {
  AppService get appService => injector.get();
}

mixin ApiServiceProvider on Object {
  ApiService get apiService => injector.get();
}