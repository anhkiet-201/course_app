import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/core/data/network/model/auth/login_provider.dart';
import 'package:kt_course/global/auth/auth_repository_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase extends BaseController with Store, AuthRepositoryProvider {

  @computed
  bool get isLogin => authRepository.isLogin;

  LoginProvider? loginProvider;

  @action
  loginWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.standard();
      final googleAccount = await googleSignIn.signIn();
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
      await authRepository.login(loginProvider!);
    } catch (e) {
      nav.showSnackBar(message: 'Something is error!');
    }
  }

  @action
  logout() async {
    loginProvider = null;
    await authRepository.logout();
  }

  @override
  FutureOr onDispose() {

  }
}