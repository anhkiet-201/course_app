// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingController on _OnboardingControllerBase, Store {
  late final _$_isLoadingAtom =
      Atom(name: '_OnboardingControllerBase._isLoading', context: context);

  bool get isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  bool get _isLoading => isLoading;

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_isLoginEamilAndPasswordAtom = Atom(
      name: '_OnboardingControllerBase._isLoginEamilAndPassword',
      context: context);

  bool get isLoginEamilAndPassword {
    _$_isLoginEamilAndPasswordAtom.reportRead();
    return super._isLoginEamilAndPassword;
  }

  @override
  bool get _isLoginEamilAndPassword => isLoginEamilAndPassword;

  @override
  set _isLoginEamilAndPassword(bool value) {
    _$_isLoginEamilAndPasswordAtom
        .reportWrite(value, super._isLoginEamilAndPassword, () {
      super._isLoginEamilAndPassword = value;
    });
  }

  late final _$_isLoginWithGoogleAtom = Atom(
      name: '_OnboardingControllerBase._isLoginWithGoogle', context: context);

  bool get isLoginWithGoogle {
    _$_isLoginWithGoogleAtom.reportRead();
    return super._isLoginWithGoogle;
  }

  @override
  bool get _isLoginWithGoogle => isLoginWithGoogle;

  @override
  set _isLoginWithGoogle(bool value) {
    _$_isLoginWithGoogleAtom.reportWrite(value, super._isLoginWithGoogle, () {
      super._isLoginWithGoogle = value;
    });
  }

  late final _$loginWithGoogleAsyncAction = AsyncAction(
      '_OnboardingControllerBase.loginWithGoogle',
      context: context);

  @override
  Future loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  late final _$showLoginSheetAsyncAction =
      AsyncAction('_OnboardingControllerBase.showLoginSheet', context: context);

  @override
  Future showLoginSheet() {
    return _$showLoginSheetAsyncAction.run(() => super.showLoginSheet());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
