import 'package:flutter/material.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/discover/controller/discover_controller.dart';
import 'package:kt_course/ui/widgets/course/course_item.dart';

class DiscoverPage extends StatelessWidget
  with ControllerProvider<DiscoverController> {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CourseItem()
        ],
      ),
    );
  }
}
