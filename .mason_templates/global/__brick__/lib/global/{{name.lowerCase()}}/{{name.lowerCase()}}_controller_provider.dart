import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/{{name.lowerCase()}}/controller/{{name.lowerCase()}}_controller.dart';

mixin {{name.pascalCase()}}ControllerProvider {
  {{name.pascalCase()}}Controller get {{name.lowerCase()}}Controller => injector.get<{{name.pascalCase()}}Controller>();
}