import 'package:flutter/material.dart';

import 'package:tiktokclone/widgets/bottom_toolbar.dart';
import 'package:tiktokclone/widgets/actions_toolbar.dart';
import 'package:tiktokclone/widgets/video_description.dart';
import 'package:tiktokclone/widgets/tiktok_video_player.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget get topSection => Container(
        height: 100,
        alignment: Alignment(0, 1), // move down within bar
        //color: Colors.yellow[900], // visual
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end, // Align bottom
            mainAxisSize: MainAxisSize.min, // Take min size so it is centered
            children: <Widget>[
              Text('Following'),
              SizedBox(width: 20),
              Text(
                'For you',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
      );

  Widget get middleSection => Expanded(
        // Row splits middle into two parts
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end, // Move to bottom (fillup)
          children: <Widget>[
            VideoDescription(), // Video description [expands horizontally]
            ActionsToolbar(), // Actions toolbar [fixed-size space on the right]
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: <Widget>[
        TikTokVideoPlayer(),
        Column(children: <Widget>[
          topSection, // Top Section (bar)
          middleSection, // Middle Section (desc + btns) [expands vertically]
          BottomToolbar(), // Bottom Section (bar)
        ]),
      ]),
    );
  }
}
