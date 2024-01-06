import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/widgets/settings/bottom_sheet/controller/setting_options_sheet_controller.dart';

class SettingOptionsSelectSheet<T> extends StatelessWidget
    with ControllerProvider<SettingOptionsSheetController<T>> {
  const SettingOptionsSelectSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = controller(context);
    return Observer(builder: (context) {
      return Column(
        children: <Widget>[
              const SizedBox(
                height: 10,
              )
            ] +
            ctrl.items.map((e) {
              return Container(
                decoration: BoxDecoration(
                    color: context.color.onPrimaryContainer.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: TextButton(
                  onPressed: () => ctrl.onChangeValue(e),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        if (e.icon != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: e.icon,
                          ),
                        Text(
                          e.title.tr(),
                          style: context.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        if (e.value == ctrl.settingValue.value)
                          Icon(
                            Icons.check,
                            color: context.color.onBackground,
                          )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      );
    });
  }
}
