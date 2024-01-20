import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/extensions/duration_extensions.dart';
import 'package:kt_course/ui/widgets/custom_video_player/controller/custom_video_player_controller.dart';

class CustomVideoPlayerControl extends StatelessWidget {
  const CustomVideoPlayerControl(this._controller, {super.key});
  final CustomVideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                if (_controller.shouldShowControlView) {
          _controller.hideCtrol();
        } else {
          _controller.showCtrol();
        }
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Observer(builder: (context) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _controller.shouldShowControlView ? 1.0 : 0.0,
            child: IgnorePointer(
              ignoring: !_controller.shouldShowControlView,
              child: Column(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_controller.isLoading)
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          )
                        else
                          IconButton(
                              onPressed: () =>
                                  _controller.setPlaying(!_controller.isPlaying),
                              icon: Icon(
                                _controller.isPlaying
                                    ? Icons.pause_circle_filled_rounded
                                    : Icons.play_circle_fill_rounded,
                                size: 40,
                                color: Colors.white.withOpacity(0.7),
                              ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          '${_controller.currentSeek.toTime} / ${_controller.maxSeek.toTime}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.7)),
                        ),
                        Expanded(
                          child: Slider(
                            label: 'asaf',
                            value: _controller.videoProgress,
                            onChangeStart: _controller.onStartSeek,
                            onChanged: _controller.onSeek,
                            onChangeEnd: _controller.onEndSeek,
                            activeColor: Colors.white.withOpacity(0.7),
                            inactiveColor: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              if (_controller.isFullscreenMode) {
                                _controller.exitFullscreenMode();
                              } else {
                                _controller.enterFullscreenMode(_controller);
                              }
                            },
                            icon: Icon(
                              _controller.isFullscreenMode
                                  ? Icons.fullscreen_exit_rounded
                                  : Icons.fullscreen_rounded,
                              color: Colors.white.withOpacity(0.7),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
