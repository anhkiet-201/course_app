import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/global/{{name.lowerCase()}}/repository/{{name.lowerCase()}}_repository.dart';

mixin {{name.pascalCase()}}RepositoryProvider {
  {{name.pascalCase()}}Repository get {{name.lowerCase()}}Repository => injector.get<{{name.pascalCase()}}Repository>();
}