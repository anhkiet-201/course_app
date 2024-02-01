import 'dart:async';

import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase extends BaseController with Store, AuthControllerProvider {

  // _SplashControllerBase() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     initialize();
  //   });
  // }

  @observable
  bool isInitialized = false;

  @action
  initialize() async {
    await Future.delayed(Duration(seconds: 2));
    if(authController.isLogin) {
      nav.toHome();
    } else {
      nav.toOnBoading();
    }
  }

  @override
  FutureOr onDispose() {

  }
}