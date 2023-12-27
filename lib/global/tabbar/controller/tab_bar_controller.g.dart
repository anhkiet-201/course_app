// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TabBarController on _TabBarControllerBase, Store {
  late final _$currentTabAtom =
      Atom(name: '_TabBarControllerBase.currentTab', context: context);

  @override
  TabBarPredefine get currentTab {
    _$currentTabAtom.reportRead();
    return super.currentTab;
  }

  @override
  set currentTab(TabBarPredefine value) {
    _$currentTabAtom.reportWrite(value, super.currentTab, () {
      super.currentTab = value;
    });
  }

  late final _$_TabBarControllerBaseActionController =
      ActionController(name: '_TabBarControllerBase', context: context);

  @override
  dynamic changeTab(int tabIndex) {
    final _$actionInfo = _$_TabBarControllerBaseActionController.startAction(
        name: '_TabBarControllerBase.changeTab');
    try {
      return super.changeTab(tabIndex);
    } finally {
      _$_TabBarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$_TabBarControllerBaseActionController.startAction(
        name: '_TabBarControllerBase.reset');
    try {
      return super.reset();
    } finally {
      _$_TabBarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTab: ${currentTab}
    ''';
  }
}
