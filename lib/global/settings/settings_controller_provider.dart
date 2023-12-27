import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/settings/controller/settings_controller.dart';

mixin SettingsControllerProvider {
  SettingsController get settingsController => injector.get<SettingsController>();
}