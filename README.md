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

### 07. Video Description content

We will add the user, video title and artist-album descriptions.

We will:
* Wrap the row with a container
  * Add `height` to give exact height size (instead of relying on size of children)
  * Add `padding` to space confortably around the text
*  Use the column with `mainAxisAlignment` to space the text evenly in the container.

![](docs/2020-07-24-13-29-24.png)

```dart
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
                  Icon(Icons.music_note, size: 15),
                  Text('Artist name - Album name - song')
                ],
              ),
            ]),
      ),
    );
  }
}
```

### 08. Actions Toolbar content

We will update the buttons for the actions toolbar.

We will add the icons to the assets/fonts folder, update the pubspec.yaml, and
create a social action button function-widget.

![](docs/2020-07-24-13-52-47.png)

```dart
import 'package:flutter/material.dart';

import 'package:tiktokclone/tiktok_icons.dart';

class ActionsToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.red[300],
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
    color: Colors.blue[300],
    margin: EdgeInsets.only(top: 20),
    child: Column(children: <Widget>[
      Icon(icon, size: iconSize, color: Colors.grey[300]),
      Padding(
        padding: EdgeInsets.only(top: 2),
        child: Text(title, style: TextStyle(fontSize: 12)),
      ),
    ]),
  );
}
```

### 09. Update Themes

We will:
1. Set default text colour to white
2. Set the music note icon to white
3. Set the background colour of the scaffold to black
4. Remove background colours on containers

![](docs/2020-07-24-14-34-51.png)

### 10. Update Actions toolbar (follow action)

We will:
* Add a follow button with stacked profile picture + plus icon
* Move some constants in actions_toolbar to the top of the file

![](docs/2020-07-24-14-40-11.png)

Unfortunately, we cannot add a `CachedNetworkImage` to a circle-shaped
`Container` (using `decoration: BoxDecoration(shape: BoxShape.circle,)`)

Instead we can use the `imageBuilder` parameter to create the image.

![](docs/2020-07-24-15-51-17.png)

A `Stack` can be used to stack widgets on top of each other.

For positioning, we can use `Positioned`, but I have decided to stick to
`Center` and `Container(alignment: Alignment(0, 1))`.

```dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:tiktokclone/tiktok_icons.dart';

class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action container
  static const double actionWidgetSize = 60.0;

  // The size of the profile image in the follow Action
  static const double profileImageSize = 50.0;

  // The size of the plus icon under the profile image in follow action
  static const double plusIconSize = 20.0;

  // Space between buttons
  static const double actionWidgetMargin = 12.0;

  // Temp profile pic URL
  static const String profilePic =
      'https://scontent-syd2-1.xx.fbcdn.net/v/t31.0-1/p200x200/23592004_543046272710670_4979707003685905568_o.jpg?_nc_cat=109&_nc_sid=7206a8&_nc_ohc=aaRxAHXuwFsAX_AOasw&_nc_ht=scontent-syd2-1.xx&_nc_tp=6&oh=8095eede8df8c47c3bea236b620b639e&oe=5F3F3AC7';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      //color: Colors.red[300], // visual
      child: Column(
          mainAxisSize: MainAxisSize.min, // Use min space and expand upwards
          children: <Widget>[
            _getFollowAction(),
            _getSocialAction(title: '3.2m', icon: TikTokIcons.heart),
            _getSocialAction(title: '16.4k', icon: TikTokIcons.chat_bubble),
            _getSocialAction(
                title: 'Share', icon: TikTokIcons.reply, iconSize: 30),
          ]),
    );
  }

  Widget _getSocialAction({String title, IconData icon, double iconSize = 35}) {
    return Container(
      width: actionWidgetSize,
      height: actionWidgetSize,
      //color: Colors.blue[300], // Visual
      margin: EdgeInsets.only(bottom: actionWidgetMargin),
      child: Column(children: <Widget>[
        Icon(icon, size: iconSize, color: Colors.grey[300]),
        Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(title, style: TextStyle(fontSize: 12)),
        ),
      ]),
    );
  }

  Widget _getFollowAction() {
    return Container(
      width: actionWidgetSize,
      height: actionWidgetSize,
      //color: Colors.blue[300], // Visual
      margin: EdgeInsets.only(bottom: actionWidgetMargin),
      child: Stack(
        children: <Widget>[
          _getProfilePicture(),
          _getPlusIcon(),
        ],
      ),
    );
  }

  Widget _getProfilePicture() {
    return Center(
      child: Container(
        height: profileImageSize,
        width: profileImageSize,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: CachedNetworkImage(
          imageUrl: profilePic,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider)),
          ),
        ),
      ),
    );
  }

  Widget _getPlusIcon() {
    return Container(
      alignment: Alignment(0, 1),
      child: Container(
        width: plusIconSize,
        height: plusIconSize,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 43, 84),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, color: Colors.white, size: 20),
      ),
    );
  }
}
```
![](docs/2020-07-24-16-13-50.png)

### 11. Update Actions Bar (music player action)

The music player button is similar to the follow action. I have no idea what
these buttons do at this time...

![](docs/2020-07-24-19-26-30.png)
```dart

  Widget _getMusicPlayerAction() {
    return Container(
      width: actionWidgetSize,
      height: actionWidgetSize,
      //color: Colors.blue[300], // Visual
      margin: EdgeInsets.only(bottom: actionWidgetMargin),
      child: Container(
        padding: EdgeInsets.all(11),
        height: profileImageSize,
        width: profileImageSize,
        decoration: BoxDecoration(
          gradient: musicGradient,
          shape: BoxShape.circle,
        ),
        child: CachedNetworkImage(
          imageUrl: profilePic,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider)),
          ),
        ),
      ),
    );
  }
```

### 12. Update top section

Top section will have 'following' and 'For you' text.

```dart
  Widget get topSection => Container(
        height: 100,
        alignment: Alignment(0, 1), // move down within bar
        color: Colors.yellow[900], // visual
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
```

![](docs/2020-07-24-19-48-14.png)


### 13. Bottom section buttons

The bottom section will have five buttons, including one fancy create button.

The buttons will be formatted using a row, aligned on main axis with equal
spacing.

The fancy 'create' button uses a stack with rounded containers.

![](docs/2020-07-24-20-05-36.png)

```dart
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
```