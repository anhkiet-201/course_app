import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class CustomSettingTile extends AbstractSettingsTile {
  final Widget child;

  const CustomSettingTile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}