import 'package:flutter/material.dart';
import 'package:kt_course/global/settings/setting_options/abstract_setting_options.dart';

enum LanguageSettingOptions implements AbstractSettingOptions {
  vi,
  eng,
  system;

  @override
  String get title => switch(this) {
    vi => 'vi_language',
    eng => 'eng_language',
    system => 'system'
  };

  @override
  int get rawValue => index;

  @override
  LanguageSettingOptions fromRawValue(int rawValue) => LanguageSettingOptions.values[rawValue];

  Locale? get toLocale => switch(this) {
    vi => const Locale('vi', 'VN'),
    eng => const Locale('en', 'US'),
    system => null,
  };
}

