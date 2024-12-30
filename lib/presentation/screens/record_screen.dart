import 'package:flutter/material.dart';

import 'dart:async';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  bool _isRecording = false;
  Timer? _timer;
  int _recordDuration = 0;

  void _startRecording() {
    setState(() {
      _isRecording = true;
      _recordDuration = 0;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _recordDuration++;
      });
    });
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
    });

    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera preview placeholder
          Center(
            child: Container(
              color: Colors.grey[900],
              child: const Icon(
                Icons.videocam,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          // Bottom controls
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.flash_on, color: Colors.white),
                  onPressed: () {},
                ),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: _isRecording ? _stopRecording : _startRecording,
                  child: Icon(
                    _isRecording ? Icons.stop : Icons.circle,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.flip_camera_ios, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Right side controls
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.music_note, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: const Icon(Icons.timer, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: const Icon(Icons.filter, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Recording duration display
          if (_isRecording)
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Recording: ${_recordDuration}s',
                  style: const TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Stack(
      children: [
        // Camera preview placeholder
        Center(
          child: Container(
            color: Colors.grey[900],
            child: const Icon(
              Icons.videocam,
              color: Colors.white,
              size: 100,
            ),
          ),
        ),
        // Bottom controls
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.flash_on, color: Colors.white),
                onPressed: () {},
              ),
              FloatingActionButton(
                backgroundColor: Colors.red,
                child: const Icon(Icons.circle, color: Colors.white, size: 30),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.flip_camera_ios, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Right side controls
        Positioned(
          right: 10,
          top: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: [
              IconButton(
                icon: const Icon(Icons.music_note, color: Colors.white),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.timer, color: Colors.white),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.filter, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
