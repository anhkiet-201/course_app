import 'dart:async';

import 'package:kt_course/core/reactive/setting_value/controller/setting_value.dart';
import 'package:kt_course/ui/widgets/settings/bottom_sheet/settings_options_sheet_item.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'setting_options_sheet_controller.g.dart';

class SettingOptionsSheetController<T> = _SettingOptionsSheetControllerBase<T> with _$SettingOptionsSheetController;

abstract class _SettingOptionsSheetControllerBase<T> extends BaseController with Store {

  final SettingValue<T> settingValue;

  final List<SettingOptionsSelectSheetItem> items;

  _SettingOptionsSheetControllerBase({
    required this.settingValue,
    required this.items
  });

  @action
  onChangeValue(SettingOptionsSelectSheetItem item) {
    settingValue.updateValue(item.value);
  }

  @override
  FutureOr onDispose() { }
}