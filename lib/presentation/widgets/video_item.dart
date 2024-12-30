import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/data/models/video_state_model.dart';
import 'package:tiktok_clone/presentation/providers/video_controller_provider.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends ConsumerWidget {
  final VideoState videoState;
  final bool isCurrentVideo;

  const VideoItem({
    super.key,
    required this.videoState,
    required this.isCurrentVideo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref
          .read(videoControllerProvider(videoState.id).notifier)
          .togglePlay(),
      child: Stack(
        children: [
          if (videoState.controller != null) ...[
            VideoPlayer(videoState.controller!),
            if (!videoState.isPlaying && isCurrentVideo)
              const Center(
                  child: Icon(Icons.play_arrow, size: 50, color: Colors.white)),
          ],
          if (videoState.isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
