import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kt_course/core/data/local/hive_storage/local_storage_provider.dart';
import 'package:kt_course/core/data/local/local_storage_key_predefined.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase extends BaseController with Store, LocalStorageProvider {

  _AppControllerBase() {
    _initialize();
  }

  @observable
  late ThemeMode themeMode;

  _initialize() {
    final themeModeData = localStorage.get(LocalStorageKeyPredefined.themeMode) ?? 0;
    themeMode = switch(themeModeData) {
      0 => ThemeMode.system,
      1 => ThemeMode.light,
      _ => ThemeMode.dark,
    };
  }

  @action
  changeThemeMode(ThemeMode themeMode) {
    final themeModeData = switch(themeMode) {
      ThemeMode.system => 0,
      ThemeMode.light => 1,
      _ => 2
    };
    localStorage.put(LocalStorageKeyPredefined.themeMode, themeModeData);
    this.themeMode = themeMode;
  }

  @override
  FutureOr onDispose() {

  }
}