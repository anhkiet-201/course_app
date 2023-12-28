import 'package:kt_course/core/data/local/hive_storage/local_storage.dart';
import 'package:kt_course/global/settings/setting_options/theme_mode_options.dart';

typedef Key<T> = LocalStorageKey<T>;
class LocalStorageKeyPredefined {
  const LocalStorageKeyPredefined._();

  /// Settings data
  static const themeMode = Key<ThemeModeSettingOptions>.setting('theme_mode');
}