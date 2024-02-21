import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/search/controller/search_controller.dart' as s;
import 'package:kt_course/ui/widgets/course/course_list_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchPage extends StatelessWidget
    with ControllerProvider<s.SearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: SafeArea(
          child: _searchBar,
        ),
      ),
      body: Observer(builder: (context) {
        final ctrl = controller(context);
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: ctrl.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _content,
        );
      }),
    );
  }

  Widget get _content => Observer(builder: (context) {
        final ctrl = controller(context);
        return SingleChildScrollView(
          controller: controller(context).scrollController,
          padding: const EdgeInsets.only(top: 100, bottom: 75),
          child: ctrl.shouldShowResult
              ? _searchResult
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label('Top key word'),
                    _recommendedSearch,
                    _label('Browse Categories'),
                    _categories
                  ],
                ),
        );
      });

  Widget get _searchResult => Observer(builder: (context) {
        return Column(
          children: [for (int i = 0; i < 10; i++) const CourseListItem()],
        );
      });

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget get _searchBar => Builder(builder: (context) {
        return Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: context.color.background,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(-1, 1),
                    color: context.color.shadow.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 1)
              ]),
          child: TextFormField(
            controller: controller(context).searchController,
            focusNode: controller(context).focusNode,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: context.color.onBackground.withOpacity(0.8)),
                prefixIcon: Observer(builder: (context) {
                  final ctrl = controller(context);
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: ctrl.isLoading
                        ? SizedBox(
                      child: LoadingAnimationWidget.horizontalRotatingDots(color: context.color.onBackground, size: 24),
                    )
                        : GestureDetector(
                            onTap: ctrl.backToRecommended,
                            child: const Icon(Icons.arrow_back_rounded),
                          ),
                  );
                }),
                suffixIcon: Observer(builder: (context) {
                  final ctrl = controller(context);
                  return GestureDetector(
                    onTap: () {
                      if (ctrl.isFocusing) {
                        ctrl.clearSearchInput();
                      } else {
                        ctrl.showFilter();
                      }
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: ctrl.shouldShowOptions
                          ? (ctrl.isFocusing
                              ? const Icon(Icons.close_rounded)
                              : const Icon(Icons.filter_list_rounded))
                          : const SizedBox(),
                    ),
                  );
                })),
          ),
        );
      });

  Widget get _recommendedSearch => Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            children: [
              for (int i = 0; i < 10; i++)
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: IconButton.outlined(
                    icon: const Text(
                      'Recommend key word',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
            ],
          ),
        );
      });

  Widget get _categories => Builder(builder: (context) {
        return Column(
          children: [
            for (int i = 0; i < 20; i++)
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'IT & Software',
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: context.color.onBackground,
                      )
                    ],
                  ),
                ),
              )
          ],
        );
      });
}
