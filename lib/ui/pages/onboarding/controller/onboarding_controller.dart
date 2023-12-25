import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'onboarding_controller.g.dart';

class OnboardingController = _OnboardingControllerBase with _$OnboardingController;

abstract class _OnboardingControllerBase extends BaseController with Store {

  @override
  FutureOr onDispose() {

  }
}