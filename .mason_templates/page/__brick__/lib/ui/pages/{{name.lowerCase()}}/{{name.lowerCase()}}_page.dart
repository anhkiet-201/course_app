import 'package:flutter/material.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/{{name.lowerCase()}}/controller/{{name.lowerCase()}}_controller.dart';

class {{name.pascalCase()}}Page extends StatelessWidget
  with ControllerProvider<{{name.pascalCase()}}Controller> {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
