import 'package:kt_course/core/data/local/hive_storage/local_storage.dart';
import 'package:kt_course/core/services/model/user/user.dart';
import 'package:kt_course/global/settings/setting_options/language_options.dart';
import 'package:kt_course/global/settings/setting_options/theme_mode_options.dart';

typedef Key<T> = LocalStorageKey<T>;
class LocalStorageKeyPredefined {
  const LocalStorageKeyPredefined._();

  /// Settings data
  static const themeMode = Key<ThemeModeSettingOptions>.setting('theme_mode');
  static const language = Key<LanguageSettingOptions>.setting('language');

  // App data cache
  static const user = Key<User>('user_data');
}