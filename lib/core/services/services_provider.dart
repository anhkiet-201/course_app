import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course_apis/core/service/api_services.dart';

mixin ApiServiceProvider on Object {
  KTCourseApiServices get apiService => injector.get();
}