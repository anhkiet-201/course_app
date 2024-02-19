import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/core/navigation/navigator.dart' as nav;
import 'package:kt_course/ui/widgets/custom_video_player/custom_video_player_full_screen.dart';
import 'package:mobx/mobx.dart';
import 'package:kt_course/core/base/controller/base_controller.dart';
import 'package:video_player/video_player.dart';
part 'custom_video_player_controller.g.dart';

class CustomVideoPlayerController = _CustomVideoPlayerControllerBase
    with _$CustomVideoPlayerController;

abstract class _CustomVideoPlayerControllerBase extends BaseController
    with Store {
  // The primary controller for playing videos.
  late final VideoPlayerController videoController;

  final Widget Function(CustomVideoPlayerController)? videoControl;

  // State variables for video playback, progress, and control visibility.
  @readonly
  bool _isLoading = false; // Indicates whether video is loading.
  @readonly
  double _videoProgress = 0; // Represents current progress (0.0 to 1.0).
  @readonly
  Duration _currentSeek = const Duration(); // Stores current playback position.
  @readonly
  Duration _maxSeek = const Duration(); // Stores total video duration.
  bool get id =>
      videoController.value.isInitialized; // Getter for initialization status.
  @readonly
  bool _isPlaying = false; // Tracks whether video is playing.
  @readonly
  bool _isFullscreenMode = false; // Indicates fullscreen mode.
  @readonly
  bool _shouldShowControlView =
      true; // Determines if video controls should be visible.
  Timer? _countToHideControl; // Timer to automatically hide controls.

  // Constructor initializes the controller with video URL, autoplay, and looping options.
  _CustomVideoPlayerControllerBase(String url, bool autoPlay, bool looping, this.videoControl) {
    videoController = VideoPlayerController.networkUrl(Uri.parse(url));
    _initialize(autoPlay, looping);
  }

  // Initializes the video controller, sets playback options, and starts tracking position.
  Future<void> _initialize(bool autoPlay, bool looping) async {
    _isLoading = true; // Mark loading as in progress.
    await videoController.initialize(); // Wait for video initialization.
    _isLoading = false; // Mark loading as complete.

    if (autoPlay) {
      setPlaying(true); // Start playback if autoplay is enabled.
    } else {
      _shouldShowControlView =
          true; // Show controls initially if not autoplaying.
    }

    videoController.setLooping(looping); // Set looping behavior.
    _videoPositionHandle(); // Start tracking video position changes.
  }

  @action
  Future<void> _videoPositionHandle() async {
    final videoDuration = videoController.value.duration;
    _maxSeek = videoDuration; // Update maximum seek duration.

    videoController.addListener(() {
      _isLoading = videoController.value.isBuffering; // Update loading state.
      _isPlaying = videoController.value.isPlaying; // Update playing state.
      videoController.position.then((value) {
        final currentDuration =
            value ?? const Duration(); // Get current position safely.
        _currentSeek = currentDuration; // Update current seek value.
        _videoProgress = currentDuration.inMilliseconds.ceilToDouble() /
            videoDuration.inMilliseconds; // Calculate progress.
      });
    });
  }

  // Handles the start of a seek operation:
  @action
  void onStartSeek(double value) {
    // Pauses the video to allow for accurate seeking.
    videoController.pause();

    // Cancels any pending timer to hide controls, ensuring visibility during seeking.
    _countToHideControl?.cancel();

    // Forces the control view to be visible for user interaction.
    _shouldShowControlView = true;
  }

  // Updates the video progress UI as the user seeks:
  @action
  void onSeek(double value) {
    // Updates the visual progress indicator based on the user's seeking position.
    _videoProgress = value;
  }

  // Handles the completion of a seek operation:
  @action
  void onEndSeek(double value) {
    // Calculates the new video position based on the final seek value.
    final newVideoPosition =
        Duration(milliseconds: (_maxSeek.inMilliseconds * value).toInt());

    // Seeks the video to the desired position.
    videoController.seekTo(newVideoPosition).then((value) {
      // Resumes playback after seeking completes.
      setPlaying(true);
    });
  }

  // Sets the playback state (play or pause) and manages control visibility:
  void setPlaying(bool value) {
    if (value) {
      // Starts video playback.
      videoController.play();
      
      // Shows the controls for play state.
      showCtrol();
    } else {
      // Pauses the video.
      videoController.pause();

      // Cancels any pending timer to hide controls, ensuring visibility in paused state.
      _countToHideControl?.cancel();

      // Shows the controls for paused state.
      _shouldShowControlView = true;
    }
  }

  // Enters fullscreen mode for immersive video playback:
  @action
  Future<void> enterFullscreenMode(CustomVideoPlayerController controller) async {
    // Updates the fullscreen mode flag.
    _isFullscreenMode = true;

    // Hides system UI elements for a more immersive experience.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);

    // Forces landscape orientation for fullscreen mode.
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    // Pushes a new fullscreen video player screen onto the navigation stack.
    final navigation = injector.get<nav.Navigator>();
    await navigation
        .push(CustomVideoPlayerFullScreen(controller))
        ?.then((value) {
      // Restores system UI and orientation when exiting fullscreen.
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      // Resets the fullscreen mode flag.
      _isFullscreenMode = false;
    });

    // Shows the controls initially in fullscreen mode.
    showCtrol();
  }

  // Exits fullscreen mode and returns to the previous screen:
  @action
  void exitFullscreenMode() {
    // Pops the fullscreen view from the navigation stack.
    injector.get<nav.Navigator>().pop();

    // Shows the controls after exiting fullscreen.
    showCtrol();
  }

  // Ensures control visibility and sets a timer for auto-hiding:
  @action
  void showCtrol() {
    // Makes the control view visible.
    _shouldShowControlView = true;

    // Cancels any existing timer to prevent multiple timers.
    _countToHideControl?.cancel();
    _countToHideControl = null;

    // If the video is playing, schedule a timer to hide controls after 3 seconds.
    if (_isPlaying) {
      _countToHideControl = Timer(const Duration(seconds: 3), () {
        _shouldShowControlView = false;
      });
    }
  }

  // Hides the control view immediately:
  @action
  void hideCtrol() {
    // Sets the control view visibility to false.
    _shouldShowControlView = false;

    // Cancels any pending timer to prevent delayed hiding.
    _countToHideControl?.cancel();
    _countToHideControl = null;
  }

  // Disposes of the video controller to release resources:
  @override
  FutureOr onDispose() {
    // Disposes of the video controller to prevent memory leaks and ensure proper cleanup.
    return videoController.dispose();
  }
}
