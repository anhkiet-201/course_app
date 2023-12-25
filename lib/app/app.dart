import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            title: 'Note',
            themeMode: ThemeMode.system,
            theme: AppTheme.light(lightDynamic),
            darkTheme: AppTheme.dark(darkDynamic),
            home: Builder(builder: (ctx) {
              final systemOverlay = Theme.of(ctx).brightness == Brightness.light
                  ? SystemUiOverlayStyle.dark.copyWith(
                      statusBarColor: Colors.transparent,
                      systemNavigationBarColor: Colors.transparent)
                  : SystemUiOverlayStyle.light.copyWith(
                      statusBarColor: Colors.transparent,
                      systemNavigationBarColor: Colors.transparent);
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: systemOverlay,
                child: Provider(
                  create: (_) => OnboardingController(),
                  child: const OnboardingPage(),
                ),
              );
            }));
      },
    );
  }
}

class ColorSchemeListView extends StatelessWidget {
  const ColorSchemeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView(
        children: [
          _buildColorItem('primary', colorScheme.primary),
          _buildColorItem('onPrimary', colorScheme.onPrimary),
          _buildColorItem('primaryContainer', colorScheme.primaryContainer),
          _buildColorItem('onPrimaryContainer', colorScheme.onPrimaryContainer),
          _buildColorItem('secondary', colorScheme.secondary),
          _buildColorItem('onSecondary', colorScheme.onSecondary),
          _buildColorItem('secondaryContainer', colorScheme.secondaryContainer),
          _buildColorItem('onSecondaryContainer', colorScheme.onSecondaryContainer),
          _buildColorItem('tertiary', colorScheme.tertiary),
          _buildColorItem('onTertiary', colorScheme.onTertiary),
          _buildColorItem('tertiaryContainer', colorScheme.tertiaryContainer),
          _buildColorItem('onTertiaryContainer', colorScheme.onTertiaryContainer),
          _buildColorItem('error', colorScheme.error),
          _buildColorItem('onError', colorScheme.onError),
          _buildColorItem('errorContainer', colorScheme.errorContainer),
          _buildColorItem('onErrorContainer', colorScheme.onErrorContainer),
          _buildColorItem('background', colorScheme.background),
          _buildColorItem('onBackground', colorScheme.onBackground),
          _buildColorItem('surface', colorScheme.surface),
          _buildColorItem('onSurface', colorScheme.onSurface),
          _buildColorItem('surfaceVariant', colorScheme.surfaceVariant),
          _buildColorItem('onSurfaceVariant', colorScheme.onSurfaceVariant),
          _buildColorItem('outline', colorScheme.outline),
          _buildColorItem('outlineVariant', colorScheme.outlineVariant),
          _buildColorItem('shadow', colorScheme.shadow),
          _buildColorItem('scrim', colorScheme.scrim),
          _buildColorItem('inverseSurface', colorScheme.inverseSurface),
          _buildColorItem('onInverseSurface', colorScheme.onInverseSurface),
          _buildColorItem('inversePrimary', colorScheme.inversePrimary),
          _buildColorItem('surfaceTint', colorScheme.surfaceTint),
        ],
      ),
    );
  }

  Widget _buildColorItem(String name, Color color) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(name, style: const TextStyle(fontSize: 18.0)),
          const SizedBox(width: 16.0),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
