import 'dart:async';

import 'package:kt_course/global/auth/auth_repository_provider.dart';
import 'package:kt_course/global/tabbar/tab_bar_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase extends BaseController with Store, AuthRepositoryProvider, TabBarControllerProvider {

  @computed
  bool get isLogin => authRepository.isLogin;

  @override
  FutureOr onDispose() {

  }
}