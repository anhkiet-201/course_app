import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:kt_course/ui/pages/account/controller/account_controller.dart';
import 'package:kt_course/ui/widgets/avatar/avatar.dart';
import 'package:kt_course/ui/widgets/settings/custom_setting_list.dart';
import 'package:kt_course/ui/widgets/settings/setting_option.dart';
import 'package:kt_course/ui/widgets/settings/setting_section.dart';
import 'package:settings_ui/settings_ui.dart';

class AccountPage extends StatelessWidget
    with ControllerProvider<AccountController>, AuthControllerProvider {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSettingList(
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
                    'Anh Kiet',
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
                        'igg.anhkiet1@gmail.com',
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
          SettingOptionsButton(title: 'settings', icon: const Icon(Icons.settings), onPress: nav.toSettings)
        ],
      );
  
  AbstractSettingsSection get _logoutButton => SettingsSectionCustom(
        tiles: [
          CustomSettingsTile(
            child: TextButton(
              onPressed: () => authController.logout(),
              style: TextButton.styleFrom(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Center(
                  child: Builder(
                    builder: (context) {
                      return Text(
                        'logout'.tr(context: context),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent
                        ),
                      );
                    }
                  ),
                ),
              ),
            )
          )
        ],
      );
}
