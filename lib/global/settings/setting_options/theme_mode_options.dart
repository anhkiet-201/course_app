import 'package:flutter/material.dart';
import 'package:kt_course/global/settings/setting_options/abstract_setting_options.dart';

enum ThemeModeSettingOptions implements AbstractSettingOptions {
  light,
  dark,
  system;

  @override
  String get title => switch(this) {
    light => 'light',
    dark => 'dark',
    system => 'system'
  };

  @override
  int get rawValue => index;

  @override
  ThemeModeSettingOptions fromRawValue(int rawValue) => ThemeModeSettingOptions.values[rawValue];

  ThemeMode get toThemeMode => switch(this) {
    light => ThemeMode.light,
    dark => ThemeMode.dark,
    system => ThemeMode.system,
  };
}

