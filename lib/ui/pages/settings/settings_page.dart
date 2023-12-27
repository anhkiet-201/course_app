import 'package:flutter/material.dart';
import 'package:kt_course/global/settings/settings_controller_provider.dart';

class SettingsPage extends StatelessWidget
  with SettingsControllerProvider {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        centerTitle: true,
      ),
    );
  }
}
