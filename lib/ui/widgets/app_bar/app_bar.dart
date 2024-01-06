import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kt_course/global/settings/settings_controller_provider.dart';

class CustomAppBar extends AppBar with SettingsControllerProvider{
  
  final String titleText;

  CustomAppBar({super.key, required this.titleText, super.elevation, super.actions}) : super(
    title: Builder(
      builder: (context) {
        return Text(
          titleText.tr(context: context),
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        );
      }
    ),
    centerTitle: true,
    leading: const CloseButton()
  );
}