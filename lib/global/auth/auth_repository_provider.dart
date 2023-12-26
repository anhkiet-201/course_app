import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';

mixin AuthRepositoryProvider {
  AuthRepository get authRepository => injector.get<AuthRepository>();
}