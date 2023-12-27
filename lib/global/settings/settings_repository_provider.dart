import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/settings/repository/settings_repository.dart';

mixin SettingsRepositoryProvider {
  SettingsRepository get settingsRepository => injector.get<SettingsRepository>();
}