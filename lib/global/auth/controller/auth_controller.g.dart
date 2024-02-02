// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  Computed<bool>? _$isLoginComputed;

  @override
  bool get isLogin => (_$isLoginComputed ??= Computed<bool>(() => super.isLogin,
          name: '_AuthControllerBase.isLogin'))
      .value;

  late final _$_currentUserAtom =
      Atom(name: '_AuthControllerBase._currentUser', context: context);

  User? get currentUser {
    _$_currentUserAtom.reportRead();
    return super._currentUser;
  }

  @override
  User? get _currentUser => currentUser;

  @override
  set _currentUser(User? value) {
    _$_currentUserAtom.reportWrite(value, super._currentUser, () {
      super._currentUser = value;
    });
  }

  late final _$loginWithGoogleAsyncAction =
      AsyncAction('_AuthControllerBase.loginWithGoogle', context: context);

  @override
  Future<void> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  late final _$loginWithEmailAndPasswordAsyncAction = AsyncAction(
      '_AuthControllerBase.loginWithEmailAndPassword',
      context: context);

  @override
  Future loginWithEmailAndPassword(
      {required String email, required String password}) {
    return _$loginWithEmailAndPasswordAsyncAction.run(() =>
        super.loginWithEmailAndPassword(email: email, password: password));
  }

  late final _$_handleLoginAsyncAction =
      AsyncAction('_AuthControllerBase._handleLogin', context: context);

  @override
  Future<void> _handleLogin() {
    return _$_handleLoginAsyncAction.run(() => super._handleLogin());
  }

  late final _$syncLoginStatusAsyncAction =
      AsyncAction('_AuthControllerBase.syncLoginStatus', context: context);

  @override
  Future<void> syncLoginStatus({bool cache = true}) {
    return _$syncLoginStatusAsyncAction
        .run(() => super.syncLoginStatus(cache: cache));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthControllerBase.logout', context: context);

  @override
  Future<void> logout({bool allDevices = false}) {
    return _$logoutAsyncAction.run(() => super.logout(allDevices: allDevices));
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin}
    ''';
  }
}
