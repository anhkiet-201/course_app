import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/global/settings/setting_options/language_options.dart';
import 'package:kt_course/global/settings/setting_options/theme_mode_options.dart';
import 'package:kt_course/global/settings/settings_controller_provider.dart';
import 'package:kt_course/ui/widgets/app_bar/app_bar.dart';
import 'package:kt_course/ui/widgets/settings/bottom_sheet/settings_options_sheet_item.dart';
import 'package:kt_course/ui/widgets/settings/custom_setting_list.dart';
import 'package:kt_course/ui/widgets/settings/setting_option.dart';
import 'package:kt_course/ui/widgets/settings/setting_section.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:kt_course/core/navigation/navigator.dart' as navigator;

class SettingsPage extends StatelessWidget with SettingsControllerProvider {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'settings'),
      body: CustomSettingList(
        sections: [
          _appearance,
          _languages
          ],
      ),
    );
  }

  AbstractSettingsSection get _appearance => SettingsSectionCustom(
        title: 'appearance',
        tiles: [
          CustomSettingsTile(
            child: Observer(builder: (_) {
              return SettingOptionsButton(
                  title: 'theme',
                  value: settingsController.themeMode.value.title,
                  icon: const Icon(Icons.phone_android_rounded),
                  onPress: () {
                    nav.toSettingOptionsSelectSheet<ThemeModeSettingOptions>(
                        title: 'theme',
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

  AbstractSettingsSection get _languages => SettingsSectionCustom(
        title: 'language',
        tiles: [
          CustomSettingsTile(
            child: Observer(builder: (context) {
              return SettingOptionsButton(
                  title: 'language',
                  value: settingsController.language.value.title,
                  icon: const Icon(Icons.language_rounded),
                  onPress: () {
                    nav.toSettingOptionsSelectSheet<LanguageSettingOptions>(
                        settingValue: settingsController.language,
                        title: 'language',
                        onChangeCallBack: (value) {
                          final locale = value.toLocale;
                          if(locale != null) {
                            navigator.Navigator.globalContext?.setLocale(locale);
                          } else {
                            navigator.Navigator.globalContext?.resetLocale();
                          }
                        },
                        items: LanguageSettingOptions.values.map((e) {
                          return SettingOptionsSelectSheetItem(
                              title: e.title, value: e);
                        }).toList());
                  });
            }),
          )
        ],
      );
}
