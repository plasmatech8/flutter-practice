import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space evenly
            crossAxisAlignment: CrossAxisAlignment.start, // Align left
            children: <Widget>[
              Text('@MrMark', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Video title'),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.music_note,
                    size: 15,
                    color: Colors.white,
                  ),
                  Text('Artist name - Album name - song')
                ],
              ),
            ]),
      ),
    );
  }
}
