import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/tabbar/controller/tab_bar_controller.dart';

mixin TabBarControllerProvider {
  TabBarController get tabbarController => injector.get<TabBarController>();
}