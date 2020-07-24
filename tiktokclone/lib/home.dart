import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Top Section (bar)
          Container(
            height: 100,
            color: Colors.yellow[300],
          ),

          // Middle Section (desc + btns) [expanded vertically]
          Expanded(
            // Row splits middle into two parts
            child: Row(
              children: <Widget>[
                // Desc section [expanded horizontally]
                Expanded(child: Container(color: Colors.green[300])),
                // Btns section [fixed-size space on the right]
                Container(
                  width: 100,
                  color: Colors.red[300],
                )
              ],
            ),
          ),

          // Bottom Section (bar)
          Container(
            height: 100,
            color: Colors.blue[300],
          ),
        ],
      ),
    );
  }
}
