import 'package:flutter/material.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/course_details/controller/course_details_controller.dart';
import 'package:kt_course/ui/widgets/app_bar/app_bar.dart';
import 'package:kt_course/ui/widgets/custom_video_player/custom_video_player.dart';
import 'package:kt_course/ui/widgets/custom_video_player/custom_video_player_control_view.dart';

class CourseDetailsPage extends StatelessWidget
  with ControllerProvider<CourseDetailsController> {
  const CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: ''),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomVideoPlayer.network(
              url: 'https://cdn.flowplayer.com/a30bd6bc-f98b-47bc-abf5-97633d4faea0/hls/de3f6ca7-2db3-4689-8160-0f574a5996ad/playlist.m3u8',
              autoPlay: false,
              looping: false,
              videoControl: (controller) => CustomVideoPlayerControl(controller),
              )
          ],
        ),
      ),
    );
  }


}
