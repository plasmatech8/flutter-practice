import 'package:flutter/material.dart';

import 'package:tiktokclone/tiktok_icons.dart';

class ActionsToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      //color: Colors.red[300],
      child: Column(
          mainAxisSize: MainAxisSize.min, // Use min space and expand upwards
          children: <Widget>[
            _getSocialAction(title: '3.2m', icon: TikTokIcons.heart),
            _getSocialAction(title: '16.4k', icon: TikTokIcons.chat_bubble),
            _getSocialAction(
                title: 'Share', icon: TikTokIcons.reply, iconSize: 30),
          ]),
    );
  }
}

Widget _getSocialAction({String title, IconData icon, double iconSize = 35}) {
  return Container(
    width: 60,
    height: 60,
    //color: Colors.blue[300],
    margin: EdgeInsets.only(bottom: 10),
    child: Column(children: <Widget>[
      Icon(icon, size: iconSize, color: Colors.grey[300]),
      Padding(
        padding: EdgeInsets.only(top: 2),
        child: Text(title, style: TextStyle(fontSize: 12)),
      ),
    ]),
  );
}
