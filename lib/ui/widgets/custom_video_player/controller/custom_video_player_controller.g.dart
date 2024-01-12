// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_video_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomVideoPlayerController on _CustomVideoPlayerControllerBase, Store {
  late final _$_isLoadingAtom = Atom(
      name: '_CustomVideoPlayerControllerBase._isLoading', context: context);

  bool get isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  bool get _isLoading => isLoading;

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_videoProgressAtom = Atom(
      name: '_CustomVideoPlayerControllerBase._videoProgress',
      context: context);

  double get videoProgress {
    _$_videoProgressAtom.reportRead();
    return super._videoProgress;
  }

  @override
  double get _videoProgress => videoProgress;

  @override
  set _videoProgress(double value) {
    _$_videoProgressAtom.reportWrite(value, super._videoProgress, () {
      super._videoProgress = value;
    });
  }

  late final _$_currentSeekAtom = Atom(
      name: '_CustomVideoPlayerControllerBase._currentSeek', context: context);

  Duration get currentSeek {
    _$_currentSeekAtom.reportRead();
    return super._currentSeek;
  }

  @override
  Duration get _currentSeek => currentSeek;

  @override
  set _currentSeek(Duration value) {
    _$_currentSeekAtom.reportWrite(value, super._currentSeek, () {
      super._currentSeek = value;
    });
  }

  late final _$_maxSeekAtom =
      Atom(name: '_CustomVideoPlayerControllerBase._maxSeek', context: context);

  Duration get maxSeek {
    _$_maxSeekAtom.reportRead();
    return super._maxSeek;
  }

  @override
  Duration get _maxSeek => maxSeek;

  @override
  set _maxSeek(Duration value) {
    _$_maxSeekAtom.reportWrite(value, super._maxSeek, () {
      super._maxSeek = value;
    });
  }

  late final _$_isPlayingAtom = Atom(
      name: '_CustomVideoPlayerControllerBase._isPlaying', context: context);

  bool get isPlaying {
    _$_isPlayingAtom.reportRead();
    return super._isPlaying;
  }

  @override
  bool get _isPlaying => isPlaying;

  @override
  set _isPlaying(bool value) {
    _$_isPlayingAtom.reportWrite(value, super._isPlaying, () {
      super._isPlaying = value;
    });
  }

  late final _$_isFullscreenModeAtom = Atom(
      name: '_CustomVideoPlayerControllerBase._isFullscreenMode',
      context: context);

  bool get isFullscreenMode {
    _$_isFullscreenModeAtom.reportRead();
    return super._isFullscreenMode;
  }

  @override
  bool get _isFullscreenMode => isFullscreenMode;

  @override
  set _isFullscreenMode(bool value) {
    _$_isFullscreenModeAtom.reportWrite(value, super._isFullscreenMode, () {
      super._isFullscreenMode = value;
    });
  }

  late final _$_shouldShowControlViewAtom = Atom(
      name: '_CustomVideoPlayerControllerBase._shouldShowControlView',
      context: context);

  bool get shouldShowControlView {
    _$_shouldShowControlViewAtom.reportRead();
    return super._shouldShowControlView;
  }

  @override
  bool get _shouldShowControlView => shouldShowControlView;

  @override
  set _shouldShowControlView(bool value) {
    _$_shouldShowControlViewAtom
        .reportWrite(value, super._shouldShowControlView, () {
      super._shouldShowControlView = value;
    });
  }

  late final _$_videoPositionHandleAsyncAction = AsyncAction(
      '_CustomVideoPlayerControllerBase._videoPositionHandle',
      context: context);

  @override
  Future<void> _videoPositionHandle() {
    return _$_videoPositionHandleAsyncAction
        .run(() => super._videoPositionHandle());
  }

  late final _$enterFullscreenModeAsyncAction = AsyncAction(
      '_CustomVideoPlayerControllerBase.enterFullscreenMode',
      context: context);

  @override
  Future<void> enterFullscreenMode(CustomVideoPlayerController controller) {
    return _$enterFullscreenModeAsyncAction
        .run(() => super.enterFullscreenMode(controller));
  }

  late final _$_CustomVideoPlayerControllerBaseActionController =
      ActionController(
          name: '_CustomVideoPlayerControllerBase', context: context);

  @override
  void onStartSeek(double value) {
    final _$actionInfo = _$_CustomVideoPlayerControllerBaseActionController
        .startAction(name: '_CustomVideoPlayerControllerBase.onStartSeek');
    try {
      return super.onStartSeek(value);
    } finally {
      _$_CustomVideoPlayerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onSeek(double value) {
    final _$actionInfo = _$_CustomVideoPlayerControllerBaseActionController
        .startAction(name: '_CustomVideoPlayerControllerBase.onSeek');
    try {
      return super.onSeek(value);
    } finally {
      _$_CustomVideoPlayerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onEndSeek(double value) {
    final _$actionInfo = _$_CustomVideoPlayerControllerBaseActionController
        .startAction(name: '_CustomVideoPlayerControllerBase.onEndSeek');
    try {
      return super.onEndSeek(value);
    } finally {
      _$_CustomVideoPlayerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void exitFullscreenMode() {
    final _$actionInfo =
        _$_CustomVideoPlayerControllerBaseActionController.startAction(
            name: '_CustomVideoPlayerControllerBase.exitFullscreenMode');
    try {
      return super.exitFullscreenMode();
    } finally {
      _$_CustomVideoPlayerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void showCtrol() {
    final _$actionInfo = _$_CustomVideoPlayerControllerBaseActionController
        .startAction(name: '_CustomVideoPlayerControllerBase.showCtrol');
    try {
      return super.showCtrol();
    } finally {
      _$_CustomVideoPlayerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void hideCtrol() {
    final _$actionInfo = _$_CustomVideoPlayerControllerBaseActionController
        .startAction(name: '_CustomVideoPlayerControllerBase.hideCtrol');
    try {
      return super.hideCtrol();
    } finally {
      _$_CustomVideoPlayerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
