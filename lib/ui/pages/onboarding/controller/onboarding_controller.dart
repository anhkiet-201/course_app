import 'dart:async';

import 'package:kt_course/core/base/repository/repository_provider.dart';
import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/app/repository/app_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'onboarding_controller.g.dart';

class OnBoardingController = _OnBoardingControllerBase with _$OnBoardingController;

abstract class _OnBoardingControllerBase extends BaseController with Store, RepositoryProvider<AppRepository> {

  @observable
  bool isLoading = false;

  bool _isInitialized = false;

  initialize() async {
    if(_isInitialized) return;
    _isInitialized = true;
    isLoading = true;
    await Future.delayed(const Duration(seconds: 3));
    await injector.initialize();
    isLoading = false;
  }

  @computed
  bool get isLogin => repository.isLogin;

  @override
  FutureOr onDispose() {

  }
}