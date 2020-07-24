import 'package:flutter/material.dart';

import 'package:tiktokclone/tiktok_icons.dart';

class BottomToolbar extends StatelessWidget {
  // Length/width of button buttons
  static const double navigationIconSize = 20.0;

  // Width of the 'create' button
  static const double createButtonWidth = 38.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(TikTokIcons.home, color: Colors.white, size: navigationIconSize),
        Icon(TikTokIcons.search, color: Colors.white, size: navigationIconSize),
        customCreateIcon,
        Icon(
          TikTokIcons.messages,
          color: Colors.white,
          size: navigationIconSize,
        ),
        Icon(
          TikTokIcons.profile,
          color: Colors.white,
          size: navigationIconSize,
        ),
      ],
    );
  }

  Widget get customCreateIcon => Container(
        width: 45,
        height: 27,
        child: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            width: createButtonWidth,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 45, 108),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            width: createButtonWidth,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 211, 234),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Center(
            child: Container(
              height: double.infinity, // Make sure that height is 100%
              width: createButtonWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Icon(Icons.add, size: 20),
            ),
          ),
        ]),
      );
}
