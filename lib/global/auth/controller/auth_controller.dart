import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/core/logger/logger.dart';
import 'package:kt_course/global/auth/auth_repository_provider.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';
import 'package:kt_course/global/tabbar/tab_bar_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase extends BaseController
    with Store, AuthRepositoryProvider, TabBarControllerProvider {
  @computed
  bool get isLogin => authRepository.isLogin;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ],
  );

  LoginMethodProvider? _loginMethodProvider;
  LoginMethodProvider? get loginMethod => _loginMethodProvider;

  @action
  Future<void> loginWithGoogle() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        nav.showSnackBar(message: 'Login is cancel!');
        return;
      }
      final authentication = await googleSignInAccount.authentication;
      final accessToken = authentication.accessToken ?? '';
      log.d(accessToken);
      _loginMethodProvider =
          GoogleLoginProvider(accessToken: accessToken);
    } catch (error) {
      log.e(error);
      nav.showSnackBar(error: error);
    }
    await _handleLogin();
  }

  @action
  loginWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    _loginMethodProvider = EmailAndPasswordLoginProvider(
        email: email,
        password: password);
    await _handleLogin();
  }

  @action
  Future<void> _handleLogin() async {
    try {
      if(_loginMethodProvider == null) {
        nav.showSnackBar(message: 'Login provider is not support!');
        return;
      }
      await authRepository.login(_loginMethodProvider!);
    } catch(error) {
      log.e(error.runtimeType);
      nav.showSnackBar(error: error);
      _googleSignIn.disconnect();
      _loginMethodProvider = null;
    }
  }

  @override
  FutureOr onDispose() {}
}
