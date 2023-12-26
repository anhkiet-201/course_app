import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends BaseController with Store {

  @override
  FutureOr onDispose() {

  }
}

