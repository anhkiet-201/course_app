import 'package:flutter/material.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/home/controller/home_controller.dart';

class HomePage extends StatelessWidget
  with ControllerProvider<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('adsa'),
        ),
      ),
    );
  }
}
