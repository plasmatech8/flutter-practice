# TLDR

Install the `provider` package (state managment)

Create a `ThemeProvider` class that looks exactly like this:
```dart
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.lightBlue,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.grey,
      scaffoldBackgroundColor: Colors.grey,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
    );
  }

  void toggleTheme() {
    _themeMode = ThemeMode.values[(_themeMode.index + 1) % ThemeMode.values.length];
    notifyListeners();
  }
}
```

You can now access the theme using:
```dart
context.watch<ThemeProvider>().themeMode;
ThemeProvider.darkTheme;
ThemeProvider.lightTheme;
context.read<ThemeProvider>().toggleTheme();
context.read<ThemeProvider>().setTheme(ThemeMode.values[prefs.getInt('theme') ?? 0]);
```

You need to:
* Set MaterialApp properties: themeMode, theme, darkTheme
* Add a toggle theme button
* Set the theme in the loading screen from the user prefs