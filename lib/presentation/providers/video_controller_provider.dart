import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiktok_clone/data/models/video_state_model.dart';
import 'package:video_player/video_player.dart';

part 'video_controller_provider.g.dart';

@riverpod
class VideoController extends _$VideoController {
  final _preloadOffset = 2;
  final Map<String, VideoPlayerController> _cachedControllers = {};
  bool _isActive = true;

  @override
  VideoState build(String videoUrl) {
    ref.onDispose(() {
      _isActive = false;
      _disposeController(videoUrl);
    });

    _initializeController(videoUrl);
    return VideoState(
      id: videoUrl,
      isPlaying: false,
      isLoading: true,
      progress: 0.0,
    );
  }

  Future<void> _initializeController(String url) async {
    if (_cachedControllers.containsKey(url)) {
      state = state.copyWith(
        controller: _cachedControllers[url],
        isLoading: false,
      );
      return;
    }

    final controller = VideoPlayerController.asset(url);
    await controller.initialize();
    _cachedControllers[url] = controller;

    controller.addListener(() {
      if (!_isActive) return;
      state = state.copyWith(
        progress: controller.value.position.inMilliseconds /
            controller.value.duration.inMilliseconds,
        isPlaying: controller.value.isPlaying,
      );
    });

    state = state.copyWith(
      controller: controller,
      isLoading: false,
    );
  }

  void _disposeController(String url) {
    _cachedControllers[url]?.dispose();
    _cachedControllers.remove(url);
  }

  Future<void> togglePlay() async {
    if (state.controller == null) return;

    if (state.isPlaying) {
      await state.controller!.pause();
    } else {
      await state.controller!.play();
    }
  }

  void preloadAdjacentVideos(List<String> urls, int currentIndex) {
    final preloadUrls = urls.sublist(
      (currentIndex + 1).clamp(0, urls.length),
      (currentIndex + 1 + _preloadOffset).clamp(0, urls.length),
    );

    for (final url in preloadUrls) {
      if (!_cachedControllers.containsKey(url)) {
        VideoPlayerController.asset(url).initialize();
      }
    }
  }
}
