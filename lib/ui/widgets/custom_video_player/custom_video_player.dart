import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:kt_course/common/extensions/hero_animation_extensions.dart';
import 'package:kt_course/ui/widgets/custom_video_player/controller/custom_video_player_controller.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer.network(
      {super.key,
      this.aspectRatio = 16 / 9,
      required this.url,
      this.autoPlay = false,
      this.looping = false,
      this.videoControl,
      this.secure = false});

  final String url;
  final bool autoPlay;
  final bool looping;
  final double aspectRatio;
  final bool secure;
  final Widget Function(CustomVideoPlayerController)? videoControl;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late final CustomVideoPlayerController _controller =
      CustomVideoPlayerController(
          widget.url,
          widget.autoPlay,
          widget.looping,
          widget.videoControl);

  @override
  void initState() {
    super.initState();
    if(widget.secure) {
      FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(_controller.videoController),
            if (_controller.videoControl != null) _controller.videoControl!(_controller)
          ],
        ),
      ).heroTag('video', transactionBuilder: ((animation, child) {
        return RotationTransition(
            turns: animation.drive(Tween<double>(begin: 0.0, end: 0.45)),
            child: child);
      }));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.onDispose();
    if(widget.secure) {
      FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    }
  }
}
