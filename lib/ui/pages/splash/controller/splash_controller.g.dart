// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashController on _SplashControllerBase, Store {
  late final _$isInitializedAtom =
      Atom(name: '_SplashControllerBase.isInitialized', context: context);

  @override
  bool get isInitialized {
    _$isInitializedAtom.reportRead();
    return super.isInitialized;
  }

  @override
  set isInitialized(bool value) {
    _$isInitializedAtom.reportWrite(value, super.isInitialized, () {
      super.isInitialized = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_SplashControllerBase.initialize', context: context);

  @override
  Future initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  @override
  String toString() {
    return '''
isInitialized: ${isInitialized}
    ''';
  }
}
