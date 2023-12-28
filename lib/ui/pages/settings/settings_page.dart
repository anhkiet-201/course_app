import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/global/settings/setting_options/theme_mode_options.dart';
import 'package:kt_course/global/settings/settings_controller_provider.dart';
import 'package:kt_course/ui/widgets/app_bar/app_bar.dart';
import 'package:kt_course/ui/widgets/settings/bottom_sheet/settings_options_sheet_item.dart';
import 'package:kt_course/ui/widgets/settings/custom_setting_list.dart';
import 'package:kt_course/ui/widgets/settings/setting_option.dart';
import 'package:kt_course/ui/widgets/settings/setting_section.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget with SettingsControllerProvider {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Settings'),
      body: CustomSettingList(
        sections: [_appearance],
      ),
    );
  }

  AbstractSettingsSection get _appearance => SettingsSectionCustom(
        title: 'Appearance',
        tiles: [
          CustomSettingsTile(
            child: Observer(builder: (_) {
              return SettingOptionsButton(
                  title: 'Theme',
                  value: settingsController.themeMode.value.title,
                  icon: const Icon(Icons.phone_android_rounded),
                  onPress: () {
                    nav.toSettingOptionsSelectSheet<ThemeModeSettingOptions>(
                        settingValue: settingsController.themeMode,
                        items: ThemeModeSettingOptions.values.map((e) {
                          return SettingOptionsSelectSheetItem(
                              title: e.title, value: e);
                        }).toList());
                  });
            }),
          )
        ],
      );
}
