import 'dart:async';

import 'package:kt_course/core/data/local/local_storage_key_predefined.dart';
import 'package:kt_course/core/reactive/setting_value/controller/setting_value.dart';
import 'package:kt_course/global/settings/setting_options/theme_mode_options.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'settings_controller.g.dart';

class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase extends BaseController with Store {

  final SettingValue<ThemeModeSettingOptions> themeMode = SettingValue(key: LocalStorageKeyPredefined.themeMode, initValue: ThemeModeSettingOptions.system);

  @override
  FutureOr onDispose() {

  }
}