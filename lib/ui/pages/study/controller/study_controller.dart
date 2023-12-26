import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
part 'study_controller.g.dart';

class StudyController = _StudyControllerBase with _$StudyController;

abstract class _StudyControllerBase extends BaseController with Store {

  @override
  FutureOr onDispose() {

  }
}