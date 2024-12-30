import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiktok_clone/data/samples.dart';
import 'package:tiktok_clone/presentation/providers/video_controller_provider.dart';

part 'video_feed_controller_provider.g.dart';

@riverpod
class VideoFeedController extends _$VideoFeedController {
  @override
  int build() => 0;

  void onPageChanged(int index) {
    // Pause previous video
    final previousUrl =
        ref.read(videoControllerProvider(videos[state % videos.length].url));
    previousUrl.controller?.pause();

    // Update index
    state = index;

    // Play current video
    final currentUrl =
        ref.read(videoControllerProvider(videos[index % videos.length].url));
    currentUrl.controller?.play();
  }
}
