# Flutter Practice

A new Flutter project.

Followed Tutorials:
* https://www.linkedin.com/learning/learning-google-flutter-for-mobile-developers/read-and-write-with-dart-io-setup?u=2093164
* ...

Things done:
* Utilised basic Widgets
* Added onclick events and navigation
	* Floating button - create a ListTile button which navigates to the SecondPage when clicked
	* RaisedButton - navigates to MyHomePage when clicked
* Imported the Font Awesome package and used icons/graphics
* Added file read/write storage

## Flutter setup and android emulator
Follow the instructions for installing and setting up Flutter: https://flutter.dev/docs/get-started/install

Unzip the contents and move somewhere (C drive). You may need to add to path when using Windows. e.g. Add C:\flutter\bin

Ensure that Android Studio is installed. Use the command flutter doctor to check that Flutter is set up.

Ensure that vscode is installed and has the Flutter and Dart extension installed.

To create an emulator device open Android Studio and open AVD manager in the top-right corner - create a device from there. You can then start the emulator from Android Studio, vscode by running a debug or using the command: `flutter emulators --launch <emulator_name>`.

You will need to run a debug session in vscode while the emulator is open to see live updates.

## Adding packages
Go to https://pub.dev/ and find a package you wish to use.

Add it to dependencies under `pubspec.yaml`. e.g.
```yaml
# An imported package for fonts
font_awesome_flutter: ^8.4.0
```

Import it in `main.dart` and you are good to use the package. e.g.
```dart
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
```

You may need to restart your emulator to see changes with packages.

## Navigation

To navigate, you will want to create a function on the onPressed event of a widget. Use the pop and push command to move towards subpages and back to parent pages.

e.g.
```dart
onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage())); },
```
```dart
onPressed: (){ Navigator.pop(context); },
```

## IO/read and write

Import the path_provider package for IO.

pubspec.yaml
```yaml
# IO operations for read and write
path_provider: ^1.1.0
```
main.dart
```dart
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
```

The class `CounterStorage` is used to read and write stored data.

`_MyHomePageState.initialState()` was created to initialise the storage.

Code was added to `_MyHomePageState._incrementCounter()` to save the to the couter file whenever the counter is incremented.
```dart
// Set storage to the counter
return widget.storage.writeCounter(_counter);
```

## HTTP requests