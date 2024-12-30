import 'package:flutter/material.dart';
import 'package:tiktok_clone/data/models/video_model.dart';

class VideoOverlay extends StatelessWidget {
  const VideoOverlay({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _profileBtn(),
                  const SizedBox(height: 15),
                  _iconBtn(icon: Icons.favorite, text: video.likes.toString()),
                  _iconBtn(icon: Icons.chat, text: video.likes.toString()),
                  _iconBtn(icon: Icons.bookmark, text: video.likes.toString()),
                  _iconBtn(icon: Icons.share, text: video.likes.toString()),
                  const SizedBox(height: 80),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(video.title),
                subtitle: Text(video.videoRef),
                trailing: CircleAvatar(
                    radius: 24, child: Image.asset('assets/logo.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _profileBtn() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 24,
          child: Image.asset('assets/logo.png'),
        ),
        Positioned(
          bottom: -6,
          right: 12,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pink,
            ),
            child: const Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child: Icon(Icons.add, size: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _iconBtn({required IconData icon, required String text}) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          padding: const EdgeInsets.only(top: 8.0),
          icon: Icon(icon, size: 40),
        ),
        Text(text),
        const SizedBox(height: 15),
      ],
    );
  }
}
