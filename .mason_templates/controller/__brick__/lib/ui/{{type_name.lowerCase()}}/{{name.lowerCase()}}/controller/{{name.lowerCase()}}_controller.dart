import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part '{{name.lowerCase()}}_controller.g.dart';

class {{name.pascalCase()}}Controller = _{{name.pascalCase()}}ControllerBase with _${{name.pascalCase()}}Controller;

abstract class _{{name.pascalCase()}}ControllerBase extends BaseController with Store {

  @override
  FutureOr onDispose() { }
}