import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingOptionsButton extends AbstractSettingsTile {
  final Function()? onPress;
  final Widget? icon;
  final String title;
  final Widget? trailing;
  final String? value;

  const SettingOptionsButton(
      {super.key,
      required this.title,
      this.icon,
      this.onPress,
      this.trailing,
      this.value});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: icon!,
                  ),
                Text(title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            const Spacer(),
            if (value != null)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(value!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            trailing ??
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )
          ],
        ),
      ),
    );
  }
}
