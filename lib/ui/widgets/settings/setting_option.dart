import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingOptionsButton extends AbstractSettingsTile {
  final Function()? onPress;
  final Widget? icon;
  final String title;
  final Widget? trailing;
  final String? value;
  final Color? color;

  const SettingOptionsButton(
      {super.key,
      required this.title,
      this.icon,
      this.onPress,
      this.trailing,
      this.value,
      this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          foregroundColor: color ?? context.color.onBackground),
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
                Text(title.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
            const Spacer(),
            if (value != null)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(value!.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
