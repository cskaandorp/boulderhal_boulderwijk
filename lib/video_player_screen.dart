import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


/// Stateful widget to fetch and then display video content.
class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.path});

  final String path;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.path);
    _controller.initialize();
    _controller.addListener(() {
      
      if (_controller.value.isInitialized && !_controller.value.isPlaying) {
        // NOTHING WORKS
        //_controller.play();
        setState(() {
          // this triggers a reload
          _isLoading = false;  
        });
      }
    });
  }

  void playVideo() {
    if (_controller.value.isInitialized && !_controller.value.isPlaying) {
      _controller.play();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: [
          Center(
            child: Image.asset(
              'sketchup_scene_image.jpg',
            ),
            
          ),
          Center(
            child: (!_isLoading)
              ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
              : Container(),
          ),
          //
          if (!_isLoading && !_controller.value.isPlaying)
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                iconSize: 100,
                onPressed: () => playVideo(),
                icon: const Icon(Icons.play_circle_outline, size: 80),
                color: Colors.black54
              )
            ),
          //
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(), // Loading spinner
            ),
        ],
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}