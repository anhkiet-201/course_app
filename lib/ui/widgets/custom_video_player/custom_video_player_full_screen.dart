import 'package:flutter/material.dart';
import 'package:kt_course/common/extensions/hero_animation_extensions.dart';
import 'package:kt_course/ui/widgets/custom_video_player/controller/custom_video_player_controller.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayerFullScreen extends StatelessWidget {
  const CustomVideoPlayerFullScreen (this._controller, {super.key});
  final CustomVideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _controller.videoController.value.aspectRatio,
              child: VideoPlayer(_controller.videoController).heroTag('video',
              transactionBuilder: ((animation, child) => RotationTransition(
                  turns: animation.drive(Tween<double>(begin: 0.0, end: 0.45)),
                  child: child))),
            ),
          ),
          if(_controller.videoControl != null)
            _controller.videoControl!(_controller)
        ],
      ),
    );
  }
}