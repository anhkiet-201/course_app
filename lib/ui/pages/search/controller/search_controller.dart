import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
import 'package:rxdart/rxdart.dart';
part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase extends BaseController with Store {

  late final TextEditingController searchController;
  late final ScrollController scrollController;
  late final StreamController<String> _searchStream;
  late final FocusNode focusNode;

  @readonly
  bool _shouldShowOptions = false;

  @readonly
  bool _shouldShowResult = false;

  @readonly
  bool _isLoading = false;

  @readonly
  bool _isFocusing = false;

  _SearchControllerBase() {
    focusNode = FocusNode();
    scrollController = ScrollController();
    searchController = TextEditingController();
    searchController.addListener(_onSearchInput);
    _searchStream = StreamController();
    _searchHandle();
    scrollController.addListener(() {
      focusNode.unfocus();
    });
    focusNode.addListener(() {
      _isFocusing = focusNode.hasFocus;
    });
  }

  @action
  _onSearchInput() {
    _shouldShowOptions = searchController.text.isNotEmpty;
    _searchStream.sink.add(searchController.text);
  }

  _searchHandle() {
    _searchStream.stream
        .debounceTime(const Duration(milliseconds: 500))
        .distinct()
        .listen((event) async {
          if(event.isEmpty) {
            _shouldShowResult = false;
            return;
          }
          _isLoading = true;
          /// TODO: implement to fetch by keyword
          await Future.delayed(const Duration(seconds: 2));
          _shouldShowResult = true;
          _isLoading = false;
        });
  }

  @action
  backToRecommended() {
    _shouldShowResult = false;
    focusNode.unfocus();
  }

  @action
  clearSearchInput() {
    searchController.clear();
  }

  showFilter() {

  }

  @override
  FutureOr onDispose() {
    searchController.dispose();
    scrollController.dispose();
    _searchStream.close();
    focusNode.dispose();
  }
}