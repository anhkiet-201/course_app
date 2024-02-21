import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kt_course/ui/pages/search/controller/search_controller.dart' as s;
import 'package:kt_course/ui/pages/account/account_page.dart';
import 'package:kt_course/ui/pages/account/controller/account_controller.dart';
import 'package:kt_course/ui/pages/discover/controller/discover_controller.dart';
import 'package:kt_course/ui/pages/discover/discover_page.dart';
import 'package:kt_course/ui/pages/search/search_page.dart';
import 'package:kt_course/ui/pages/study/controller/study_controller.dart';
import 'package:kt_course/ui/pages/study/study_page.dart';
import 'package:kt_course/ui/widgets/common/keep_alive_page.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
import 'package:provider/provider.dart';
part 'tab_bar_controller.g.dart';

class TabBarController = _TabBarControllerBase with _$TabBarController;

abstract class _TabBarControllerBase extends BaseController with Store {

  @observable
  TabBarPredefine currentTab = TabBarPredefine.discover;

  late final PageController pageController = PageController(initialPage: currentTab.intValue);

  final listTab = [
    TabBarPredefine.discover,
    TabBarPredefine.search,
    TabBarPredefine.study,
    TabBarPredefine.account
  ];

  @action 
  changeTab(int tabIndex) {
    currentTab = listTab[tabIndex];
    pageController.animateToPage(tabIndex, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @action
  reset() {
    changeTab(0);
  }

  @override
  FutureOr onDispose() {
    pageController.dispose();
  }
}

enum TabBarPredefine {
  discover,
  search,
  study,
  account;

  int get intValue => switch(this) {
    discover => 0,
    search => 1,
    study => 2,
    account => 3
  };

  String get title => switch(this) {
    discover => 'Discover',
    search => 'Search',
    study => 'Study',
    _ => ''
  };

  IconData get icon => switch(this) {
    discover => Icons.disabled_by_default,
    search => Icons.disabled_by_default,
    study => Icons.disabled_by_default,
    account => Icons.disabled_by_default
  };

  Widget get page => switch(this) {
    discover => KeepAlivePage(
      child: Provider(
        create: (_) => DiscoverController(),
        child: const DiscoverPage(),
      ),
    ),
    search => KeepAlivePage(
      child: Provider(
        create: (_) => s.SearchController(),
        child: const SearchPage(),
      ),
    ),
    study => KeepAlivePage(
      child: Provider(
        create: (_) => StudyController(),
        child: const StudyPage(),
      ),
    ),
    account => KeepAlivePage(
      child: Provider(
        create: (_) => AccountController(),
        child: const AccountPage(),
      ),
    )
  };
}