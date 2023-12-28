abstract class AbstractSettingOptions {
  String get title;

  int get rawValue;

  AbstractSettingOptions fromRawValue(int rawValue);
}