import 'package:dynamic_color/dynamic_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/theme/app_theme.dart';
import 'package:kt_course/core/navigation/navigator.dart' as nav;
import 'package:kt_course/global/settings/settings_controller_provider.dart';
import 'package:kt_course/ui/pages/splash/controller/splash_controller.dart';
import 'package:kt_course/ui/pages/splash/splash_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget with SettingsControllerProvider {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return Observer(
          builder: (_) {
            return MaterialApp(
              navigatorKey: nav.Navigator.navigationKey,
              debugShowCheckedModeBanner: false,
              title: 'Note',
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              themeMode: settingsController.themeMode.value.toThemeMode,
              theme: AppTheme.light(lightDynamic),
              darkTheme: AppTheme.dark(darkDynamic),
              home: Provider(
                create: (_) => SplashController(),
                child: const SplashPage(),
              ),
              builder: (ctx, child) {
                final systemOverlay = Theme.of(ctx).brightness == Brightness.light
                    ? SystemUiOverlayStyle.dark.copyWith(
                        statusBarColor: Colors.transparent,
                        systemNavigationBarColor: Colors.transparent)
                    : SystemUiOverlayStyle.light.copyWith(
                        statusBarColor: Colors.transparent,
                        systemNavigationBarColor: Colors.transparent);
                return AnnotatedRegion<SystemUiOverlayStyle>(
                    value: systemOverlay, child: child!);
              },
            );
          }
        );
      },
    );
  }
}