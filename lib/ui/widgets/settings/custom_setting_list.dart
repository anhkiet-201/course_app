import 'package:flutter/material.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:settings_ui/settings_ui.dart';

class CustomSettingList extends StatelessWidget {
  const CustomSettingList({super.key, required this.sections});
  final List<AbstractSettingsSection> sections;

  @override
  Widget build(BuildContext context) {
    final settingTheme = SettingsThemeData(
      settingsListBackground: context.color.background,
      settingsSectionBackground: Colors.transparent,
      leadingIconsColor: context.color.onBackground,
      dividerColor: context.color.background,
      tileHighlightColor: Colors.transparent,
    );
    return SettingsList(
        platform: DevicePlatform.iOS,
        lightTheme: settingTheme,
        darkTheme: settingTheme,
        applicationType: ApplicationType.cupertino,
        contentPadding: EdgeInsets.only(top: context.mediaQueryPadding.top),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        sections: sections,
      );
  }
}