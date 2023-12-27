import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/core/reactive/setting_value/repository/setting_value_repository.dart';

mixin SettingValueRepositoryProvider {
  SettingValueRepository get settingvalueRepository => injector.get<SettingValueRepository>();
}