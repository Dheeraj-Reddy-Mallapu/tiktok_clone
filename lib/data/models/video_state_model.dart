import 'package:video_player/video_player.dart';

class VideoState {
  final String id;
  final bool isPlaying;
  final bool isLoading;
  final double progress;
  final VideoPlayerController? controller;

  VideoState({
    required this.id,
    required this.isPlaying,
    required this.isLoading,
    required this.progress,
    this.controller,
  });

  VideoState copyWith({
    bool? isPlaying,
    bool? isLoading,
    double? progress,
    VideoPlayerController? controller,
  }) {
    return VideoState(
      id: id,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
      progress: progress ?? this.progress,
      controller: controller ?? this.controller,
    );
  }
}
