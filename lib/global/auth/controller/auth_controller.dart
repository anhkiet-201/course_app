import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/core/data/local/hive_storage/local_storage.dart';
import 'package:kt_course/core/data/local/hive_storage/local_storage_provider.dart';
import 'package:kt_course/core/data/local/local_storage_key_predefined.dart';
import 'package:kt_course/core/logger/logger.dart';
import 'package:kt_course/core/services/model/user/user.dart';
import 'package:kt_course/global/auth/auth_repository_provider.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';
import 'package:kt_course/global/tabbar/tab_bar_controller_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase extends BaseController
    with Store, AuthRepositoryProvider, 
    TabBarControllerProvider,
    LocalStorageProvider {

  _AuthControllerBase() {
    _currentUser = localStorage.get(LocalStorageKeyPredefined.user);   
  }

  @readonly
  User? _currentUser;

  @computed
  bool get isLogin => _currentUser == null;

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
      log.d('Login successfull');
      await syncLoginStatus();
    } catch(error) {
      log.e(error);
      nav.showSnackBar(error: error);
      _googleSignIn.disconnect();
      _loginMethodProvider = null;
    }
  }

  @action
  Future<void> syncLoginStatus({bool cache = true}) async {
    try {
      log.d('Syncing user data');
      _currentUser = await authRepository.getProfile();
      if(cache) {
        await localStorage.put(LocalStorageKeyPredefined.user, _currentUser);
      }
      log.d('Sync user data done');
    } catch(e) {
      log.e(e,message: 'Error while sync user data');
      nav.showSnackBar(error: e);
      _googleSignIn.disconnect();
    }
  }

  @action
  Future<void> logout({bool allDevices = false}) async {
    try {
      log.d('Start logout');
      await authRepository.logout(allDevices: allDevices);
      await _googleSignIn.disconnect();
      log.d('Delete data');
      await localStorage.delete(LocalStorageKeyPredefined.user);
      await Hive.box<String>(LocalStorage.tokenBox).clear();
      _currentUser = null;
      nav.toOnBoading();
    } catch(e) {
      log.e(e);
      nav.showSnackBar(error: e);
    }
  }

  @override
  FutureOr onDispose() {}
}
