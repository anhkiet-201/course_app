import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:kt_course/common/theme/app_theme.dart';
import 'package:kt_course/core/navigation/navigator.dart' as nav;
import 'package:kt_course/ui/pages/onboarding/controller/onboarding_controller.dart';
import 'package:kt_course/ui/pages/onboarding/onboarding_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          navigatorKey: nav.Navigator.navigationKey,
          debugShowCheckedModeBanner: false,
            title: 'KTCourse',
            themeMode: ThemeMode.light,
            theme: AppTheme.light(lightDynamic),
            darkTheme: AppTheme.dark(darkDynamic),
            home: Provider(
              create: (_) => OnBoardingController(),
              child: const OnBoardingPage(),
            )
        );
      },
    );
  }
}