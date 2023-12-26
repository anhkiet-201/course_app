import 'package:flutter/material.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsSectionCustom extends AbstractSettingsSection {
  final List<AbstractSettingsTile> tiles;
  final String title;
  final double? customRadius;
  final double customHMargin;
  final double customVMargin;
  final Color? customBackgroundColor;

  const SettingsSectionCustom(
      {super.key,
      required this.tiles,
      this.title = '',
      this.customRadius,
      this.customVMargin = 5,
      this.customHMargin = 12,
      this.customBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _renderTitle,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: customHMargin, vertical: customVMargin),
          child: Container(
            margin: EdgeInsets.only(top: title != '' ? 12 : 0),
            decoration: BoxDecoration(
              color: customBackgroundColor ?? context.color.onPrimaryContainer.withOpacity(.2),
              borderRadius: BorderRadius.circular(customRadius ?? 10),
            ),
            child: SettingsSection(
                tiles: tiles, margin: const EdgeInsetsDirectional.all(0)),
          ),
        ),
      ],
    );
  }

  Widget get _renderTitle => Builder(builder: (context) {
        if (title.isNotEmpty) {
          return Text(title!.toUpperCase(),
              style: TextStyle(
                color: context.color.onBackground,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ));
        }
        return Container();
      });
}