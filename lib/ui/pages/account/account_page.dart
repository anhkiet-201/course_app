import 'package:flutter/material.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:kt_course/ui/pages/account/controller/account_controller.dart';
import 'package:kt_course/ui/widgets/avatar/avatar.dart';
import 'package:kt_course/ui/widgets/settings/setting_option.dart';
import 'package:kt_course/ui/widgets/settings/setting_section.dart';
import 'package:settings_ui/settings_ui.dart';

class AccountPage extends StatelessWidget
    with ControllerProvider<AccountController>, AuthControllerProvider {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingTheme = SettingsThemeData(
      settingsListBackground: context.color.background,
      settingsSectionBackground: Colors.transparent,
      leadingIconsColor: context.color.onBackground,
      dividerColor: context.color.background,
      tileHighlightColor: Colors.transparent,
    );
    return Scaffold(
      body: SettingsList(
        platform: DevicePlatform.iOS,
        lightTheme: settingTheme,
        darkTheme: settingTheme,
        applicationType: ApplicationType.cupertino,
        contentPadding: EdgeInsets.only(top: context.mediaQueryPadding.top),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        sections: [
          _info,
          _optionsList,
          _logoutButton
        ],
      ),
    );
  }

  AbstractSettingsSection get _info => SettingsSection(
        tiles: [
          CustomSettingsTile(child: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Avatar(
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    authController.user.displayName ?? '',
                    style: context.textTheme.headlineMedium
                        ?.copyWith(color: context.color.onBackground),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: context.color.onBackground,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        authController.user.email ?? '',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.color.onBackground,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }))
        ],
      );

  AbstractSettingsSection get _optionsList => SettingsSectionCustom(
        tiles: [
          SettingOptionsButton(title: 'Settings', icon: const Icon(Icons.settings), value: 'Eng', onPress: () {},)
        ],
      );
  
  AbstractSettingsSection get _logoutButton => SettingsSectionCustom(
        tiles: [
          CustomSettingsTile(
            child: TextButton(
              onPressed: authController.logout,
              style: TextButton.styleFrom(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Center(
                  child: Text(
                    'Đăng xuất',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent
                    ),
                  ),
                ),
              ),
            )
          )
        ],
      );
}
