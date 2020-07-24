import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:cached_video_player/cached_video_player.dart';

class TikTokVideoPlayer extends StatefulWidget {
  @override
  _TikTokVideoPlayerState createState() => _TikTokVideoPlayerState();
}

class _TikTokVideoPlayerState extends State<TikTokVideoPlayer> {
  CachedVideoPlayerController _controller;

  static String spaceVideoUrl =
      'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1280_10MG.mp4';

  static String girlVideoUrl =
      'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4';

  String videoUrl = girlVideoUrl;

  @override
  void initState() {
    super.initState();
    _controller = CachedVideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized,
        // even before the play button has been pressed.
        setState(() {});
      });
    _controller.setLooping(true); // Enable looping
    _controller.play(); // Play immediately when loaded
  }

  Widget get videoPlayer => Center(
        child: _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: CachedVideoPlayer(_controller))
            : CircularProgressIndicator(), // loading
      );

  Widget get tapArea => InkWell(
        onTap: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        highlightColor: Colors.transparent,
        child: Container(),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(children: <Widget>[
        videoPlayer,
        tapArea,
      ]),
    );
  }
}
