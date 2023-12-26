import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/app/repository/app_repository.dart';

mixin AppRepositoryProvider {
  AppRepository get appRepository => injector.get<AppRepository>();
}