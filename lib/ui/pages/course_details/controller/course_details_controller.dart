import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
import 'package:video_player/video_player.dart';
part 'course_details_controller.g.dart';

class CourseDetailsController = _CourseDetailsControllerBase with _$CourseDetailsController;

abstract class _CourseDetailsControllerBase extends BaseController with Store {

  late final VideoPlayerController videoController;

  _CourseDetailsControllerBase() {
  }

  // Override the onDispose method to clean up the video controller.
  @override
  FutureOr onDispose() {
  }
}