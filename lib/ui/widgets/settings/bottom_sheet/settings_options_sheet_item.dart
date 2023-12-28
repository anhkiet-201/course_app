import 'package:flutter/widgets.dart';

class SettingOptionsSelectSheetItem<T> {
  final Widget? icon;
  final String title;
  final T? value;

  const SettingOptionsSelectSheetItem({required this.title, required this.value, this.icon});
}