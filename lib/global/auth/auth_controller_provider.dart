import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/auth/controller/auth_controller.dart';

mixin AuthControllerProvider {
  AuthController get authController => injector.get<AuthController>();
}