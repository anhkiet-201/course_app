// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_sheet_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginSheetController on _LoginSheetControllerBase, Store {
  late final _$_isValidAtom =
      Atom(name: '_LoginSheetControllerBase._isValid', context: context);

  bool get isValid {
    _$_isValidAtom.reportRead();
    return super._isValid;
  }

  @override
  bool get _isValid => isValid;

  @override
  set _isValid(bool value) {
    _$_isValidAtom.reportWrite(value, super._isValid, () {
      super._isValid = value;
    });
  }

  late final _$_LoginSheetControllerBaseActionController =
      ActionController(name: '_LoginSheetControllerBase', context: context);

  @override
  void onTextChange() {
    final _$actionInfo = _$_LoginSheetControllerBaseActionController
        .startAction(name: '_LoginSheetControllerBase.onTextChange');
    try {
      return super.onTextChange();
    } finally {
      _$_LoginSheetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
