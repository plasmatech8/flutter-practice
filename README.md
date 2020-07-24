# Tiktok clone

Following tutorials

Building TikTok's UI in Flutter - By Dane Mackier
* https://www.youtube.com/watch?v=kJ2mGh5BLYk
* https://www.filledstacks.com/post/building-tik-tok-s-ui-in-flutter-the-building-process/
* https://github.com/FilledStacks/flutter-tutorials/tree/master/001-tik_tok_ui

![](docs/2020-07-24-11-55-58.png)


## Steps

### 01. Layout


First we will layout the sections.
![](docs/2020-07-24-12-21-02.png)
```dart
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
```

### 02. Section widgets

We will seperate each section into getter properties for code
clarity/modularity.
* topSection
* middleSection
  * videoDescription
  * actionsToolbar
* bottomSection
```dart
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
          children: <Widget>[
            videoDescription, // Video description [expands horizontally]
            actionsToolbar, // Actions toolbar [fixed-size space on the right]
          ],
        ),
      );

  Widget get videoDescription => Expanded(
        child: Container(color: Colors.green[300]),
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
```

### 03. Video Description layout

The video description will comprise of a number of rows which fills upwards
from the bottom of the middle section.
![](docs/2020-07-24-12-47-57.png)
```dart
  Widget get middleSection => Expanded(
        // Row splits middle into two parts (left/right)
        child: Row(
          mainAxisSize: MainAxisSize.max, // ??? don't know what this does
          crossAxisAlignment: CrossAxisAlignment.end, // Move to bottom (fillup)
          children: <Widget>[
            videoDescription, // Video description [expands horizontally]
            actionsToolbar, // Actions toolbar [fixed-size space on the right]
          ],
        ),
      );

  Widget get videoDescription => Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Only take up space of children (so it fills from bottom only to the required space)
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
```

### 04. Actions Toolbar layout

The actions toolbar will have a bunch of buttons. The buttons will fill minimum
space so that it does not fill from top to bottom and expands upwards.
![](docs/2020-07-24-12-56-31.png)
```dart
  Widget get actionsToolbar => Container(
        width: 100,
        color: Colors.red[300],
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use minimum size so it takes minimum space and expands upwards when more buttons exists
          children: List<Widget>.generate(
            5,
            (_) => Container(
              width: 60,
              height: 60,
              color: Colors.blue[300],
              margin: EdgeInsets.only(top: 20),
            ),
          ),
        ),
      );
```

### 05. Bottom Section bar

We will set the bottom section as evenly spaced container widgets horizontally.
![](docs/2020-07-24-13-04-16.png)
```dart
  Widget get bottomSection => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
          5,
          (index) => Container(
            width: 40,
            height: 40,
            color: Colors.purple[300],
          ),
        ),
      );
```

### 06. Modularise into files

We will move widgets into their own files:
* actions_toolbar
* bottom_toolbar
* video_description

it is a good idea to only modularise widgets if they have reletively small
formatting (like always at bottom, size filled, etc).
