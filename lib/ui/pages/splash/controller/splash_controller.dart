import 'dart:async';

import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/core/di/Injector.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase extends BaseController with Store {

    @observable
  bool isInitialized = false;

  @action
  initialize() async {
    if(!isInitialized) {
      await injector.initialize();
      await Future.delayed(const Duration(seconds: 2));
      isInitialized = true;
    }
    nav.toOnBoading();
  }

  @override
  FutureOr onDispose() {

  }
}