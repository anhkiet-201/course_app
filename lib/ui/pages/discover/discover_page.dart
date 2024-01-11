import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/discover/controller/discover_controller.dart';
import 'package:kt_course/ui/widgets/course/course_item.dart';

class DiscoverPage extends StatelessWidget
    with ControllerProvider<DiscoverController> {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: context.mediaQueryPadding.top,
            bottom: kBottomNavigationBarHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _mediumSection(label: 'Recommended for %/you%'),
            _categories,
            _smallSection(label: 'Recommended for you'),
            _mediumSection(label: 'Recommended for you')
          ],
        ),
      ),
    );
  }

  /// Mark the special text by %/text%
  Widget _label(String text) => Builder(builder: (context) {
        final buildText = text.split('%');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text.rich(
            TextSpan(
                children: buildText
                    .map((e) => TextSpan(
                        text: e.replaceFirst('/', ''),
                        style: e.startsWith('/')
                            ? TextStyle(color: context.color.primary)
                            : null))
                    .toList()),
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        );
      });

  Widget _mediumSection({required String label}) => Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _label(label),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: List.generate(10, (index) => const CourseItem()),
                ),
              ),
            ],
          ),
        );
      });

  Widget _smallSection({required String label}) => Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _label(label),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children:
                      List.generate(10, (index) => const CourseItem.small()),
                ),
              ),
            ],
          ),
        );
      });

  Widget get _categories => Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label('Categories'),
            SizedBox(
              height: 100,
              child: MasonryGridView.builder(
                  itemCount: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: IconButton.outlined(
                        icon: Text(
                          '${Random().nextInt(1000000)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      ),
                    );
                  }),
            ),
          ],
        );
      });
}
