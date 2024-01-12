import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/extensions/hero_animation_extensions.dart';
import 'package:kt_course/ui/widgets/custom_video_player/controller/custom_video_player_controller.dart';
import 'package:kt_course/ui/widgets/custom_video_player/custom_video_player_control_view.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer.network({
    super.key,
    this.aspectRatio = 16 / 9,
    required this.url,
    this.autoPlay = false,
    this.looping = false,
  });

  final String url;
  final bool autoPlay;
  final bool looping;
  final double aspectRatio;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late final CustomVideoPlayerController _controller =
      CustomVideoPlayerController(widget.url, widget.autoPlay, widget.looping);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          if(_controller.shouldShowControlView) {
            _controller.hideCtrol();
          } else {
            _controller.showCtrol();
          }
      },
      child: Observer(builder: (context) {
        return AspectRatio(
          aspectRatio: widget.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(_controller.videoController),
              CustomVideoPlayerControl(_controller)
            ],
          ),
        ).heroTag('video', transactionBuilder: ((animation, child) {
          return RotationTransition(
              turns: animation.drive(Tween<double>(begin: 0.0, end: 0.45)),
              child: child);
        }));
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.onDispose();
  }
}