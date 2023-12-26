import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/core/data/network/model/auth/login_provider.dart';
import 'package:kt_course/global/auth/auth_repository_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
import 'package:kt_course/core/data/network/model/user/user.dart' as u;

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase extends BaseController with Store, AuthRepositoryProvider {

  @computed
  bool get isLogin => authRepository.isLogin;

  LoginProvider? loginProvider;

  final _googleSignIn = GoogleSignIn.standard();

  @action
  loginWithGoogle() async {
    try {
      final googleAccount = await _googleSignIn.signIn();
      if(googleAccount == null) {
        nav.showSnackBar(message: 'Login failure!');
        return;
      }
      final googleSignInAuthentication = await googleAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );
      loginProvider = GoogleLoginProvider(credential);
      await _login();
    } catch (e) {
      _googleSignIn.disconnect();
      nav.showSnackBar(message: 'Something is error!');
    }
  }

  _login() async {
    await authRepository.login(loginProvider!);
    nav.toHome();
  }

  @action
  logout() async {
    loginProvider = null;
    await authRepository.logout();
    await _googleSignIn.disconnect();
    nav.toOnBoading();
  }

  u.User get user => authRepository.user;

  @override
  FutureOr onDispose() {

  }
}