import 'package:flutter/material.dart';

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
            videoDescription, // Video description [expands horizontally]
            actionsToolbar, // Actions toolbar [fixed-size space on the right]
          ],
        ),
      );

  Widget get videoDescription => Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Only take up space of children
          children: <Widget>[
            Container(
                height: 10,
                color: Colors.green[300],
                margin: EdgeInsets.only(top: 10)),
            Container(
                height: 10,
                color: Colors.green[300],
                margin: EdgeInsets.only(top: 10)),
            Container(
                height: 10,
                color: Colors.green[300],
                margin: EdgeInsets.only(top: 10)),
          ],
        ),
      );

  Widget get actionsToolbar => Container(
        width: 100,
        color: Colors.red[300],
      );

  Widget get bottomSection => Container(
        height: 100,
        color: Colors.blue[300],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          topSection, // Top Section (bar)
          middleSection, // Middle Section (desc + btns) [expands vertically]
          bottomSection, // Bottom Section (bar)
        ],
      ),
    );
  }
}
