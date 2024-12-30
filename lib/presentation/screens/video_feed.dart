import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/data/samples.dart';
import 'package:tiktok_clone/presentation/providers/video_controller_provider.dart';
import 'package:tiktok_clone/presentation/providers/video_feed_controller_provider.dart';
import 'package:tiktok_clone/presentation/widgets/video_item.dart';
import 'package:tiktok_clone/presentation/widgets/video_overlay.dart';

class VideoFeed extends ConsumerWidget {
  const VideoFeed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(videoFeedControllerProvider);

    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: null,
          onPageChanged: (index) {
            final cyclicIndex = (index % videos.length).toInt();
            ref
                .read(videoFeedControllerProvider.notifier)
                .onPageChanged(cyclicIndex);
          },
          itemBuilder: (context, index) {
            final cyclicIndex = index % videos.length;
            final isCurrentVideo = cyclicIndex == currentIndex;
            final videoState =
                ref.watch(videoControllerProvider(videos[cyclicIndex].url));

            return Stack(
              children: [
                VideoItem(
                  videoState: videoState,
                  isCurrentVideo: isCurrentVideo,
                ),
                VideoOverlay(
                  video: videos[cyclicIndex],
                ),
              ],
            );
          },
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.live_tv, size: 30),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Following',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'For You',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, size: 30),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
