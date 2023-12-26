import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/app/controller/app_controller.dart';

mixin AppControllerProvider {
  AppController get appController => injector.get<AppController>();
}