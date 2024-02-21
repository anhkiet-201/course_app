// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchController on _SearchControllerBase, Store {
  late final _$_shouldShowOptionsAtom =
      Atom(name: '_SearchControllerBase._shouldShowOptions', context: context);

  bool get shouldShowOptions {
    _$_shouldShowOptionsAtom.reportRead();
    return super._shouldShowOptions;
  }

  @override
  bool get _shouldShowOptions => shouldShowOptions;

  @override
  set _shouldShowOptions(bool value) {
    _$_shouldShowOptionsAtom.reportWrite(value, super._shouldShowOptions, () {
      super._shouldShowOptions = value;
    });
  }

  late final _$_shouldShowResultAtom =
      Atom(name: '_SearchControllerBase._shouldShowResult', context: context);

  bool get shouldShowResult {
    _$_shouldShowResultAtom.reportRead();
    return super._shouldShowResult;
  }

  @override
  bool get _shouldShowResult => shouldShowResult;

  @override
  set _shouldShowResult(bool value) {
    _$_shouldShowResultAtom.reportWrite(value, super._shouldShowResult, () {
      super._shouldShowResult = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_SearchControllerBase._isLoading', context: context);

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

  late final _$_isFocusingAtom =
      Atom(name: '_SearchControllerBase._isFocusing', context: context);

  bool get isFocusing {
    _$_isFocusingAtom.reportRead();
    return super._isFocusing;
  }

  @override
  bool get _isFocusing => isFocusing;

  @override
  set _isFocusing(bool value) {
    _$_isFocusingAtom.reportWrite(value, super._isFocusing, () {
      super._isFocusing = value;
    });
  }

  late final _$_SearchControllerBaseActionController =
      ActionController(name: '_SearchControllerBase', context: context);

  @override
  dynamic _onSearchInput() {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase._onSearchInput');
    try {
      return super._onSearchInput();
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backToRecommended() {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.backToRecommended');
    try {
      return super.backToRecommended();
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSearchInput() {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.clearSearchInput');
    try {
      return super.clearSearchInput();
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
