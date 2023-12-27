import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kt_course/core/data/local/hive_storage/local_storage.dart';
import 'package:kt_course/core/reactive/setting_value/setting_value_repository_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'setting_value.g.dart';

class SettingValue<T> = _SettingValueBase<T> with _$SettingValue;

abstract class _SettingValueBase<T> extends BaseController with Store, SettingValueRepositoryProvider {

  final LocalStorageKey<T> key;

  @observable
  T _value;

  @computed
  T get value => _value;

  @action
  void updateValue(T? newValue) {
    final previousValue = _value;
    try {
      settingvalueRepository.save(key, newValue);
      _value = newValue ?? _initValue;
    } catch(error, stackTrace) {
      debugPrintStack(label: 'Setting update value error!', stackTrace: stackTrace);
      _value = previousValue;
    }
  }

  final T _initValue;
  T get initValue => _initValue;

  _SettingValueBase({
    required this.key,
    required T initValue
  }) : 
  _value = initValue,
  _initValue = initValue {
    _value = settingvalueRepository.get(key) ?? initValue;
  }

  @override
  FutureOr onDispose() {

  }
}