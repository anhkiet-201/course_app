import 'package:flutter/material.dart';
import 'package:kt_course/app/app.dart';
import 'package:kt_course/core/di/Injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.initialize();
  runApp(const App());
}