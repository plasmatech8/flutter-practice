import 'package:flutter/material.dart';

import 'package:tiktokclone/widgets/bottom_toolbar.dart';
import 'package:tiktokclone/widgets/actions_toolbar.dart';
import 'package:tiktokclone/widgets/video_description.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget get topSection => Container(
        height: 100,
        color: Colors.yellow[300],
      );

  Widget get middleSection => Expanded(
        // Row splits middle into two parts
        child: Row(
          //mainAxisSize: MainAxisSize.max,
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
      body: Column(
        children: <Widget>[
          topSection, // Top Section (bar)
          middleSection, // Middle Section (desc + btns) [expands vertically]
          BottomToolbar(), // Bottom Section (bar)
        ],
      ),
    );
  }
}
