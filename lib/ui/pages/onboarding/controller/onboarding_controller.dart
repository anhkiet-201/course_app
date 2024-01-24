import 'dart:async';

import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'onboarding_controller.g.dart';

class OnboardingController = _OnboardingControllerBase with _$OnboardingController;

abstract class _OnboardingControllerBase extends BaseController with Store, AuthControllerProvider {

  @readonly
  bool _isLoading = false;

  @readonly
  bool _isLoginEamilAndPassword = false;

  @readonly
  bool _isLoginWithGoogle = false;

  @action
  loginWithGoogle() async {
    _isLoading = true;
    _isLoginWithGoogle = true;
    await authController.loginWithGoogle();
    _isLoading = false;
    _isLoginWithGoogle = false;
  }

  @override
  FutureOr onDispose() {

  }
}