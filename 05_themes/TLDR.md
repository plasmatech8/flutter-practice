# TLDR

Install the `provider` package (state managment) and `shared_preferences` (user settings).

Create a `ThemeProvider` class that looks exactly like this:
```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.deepPurple[700],
      accentColor: Colors.deepPurple[400],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.deepPurple[900],
      accentColor: Colors.deepPurple[600],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      ),
    );
  }

  Future<void> initTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeModeIndex = prefs.getInt('themeMode') ?? 0;
    setTheme(ThemeMode.values[themeModeIndex]);
  }

  void toggleTheme() {
    int themeModeIndex = (_themeMode.index + 1) % ThemeMode.values.length;
    setTheme(ThemeMode.values[themeModeIndex]);
  }

  void setTheme(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeMode', themeMode.index);
    _themeMode = themeMode;
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
context.read<ThemeProvider>().initTheme();
```

You need to:
* Set MaterialApp properties: themeMode, theme, darkTheme
* Add a toggle theme button
* Initialise the theme in the loading screen from the user prefs or using FutureBuilder

## Styling

To style our widget we can either set them explicitly in the theme, or set the theme on
the widget:
```dart
textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
// OR
Text('asdasd', style: TextStyle(color: Theme.of(context.accentColor));
```

## Initialisation

To initialise the theme on app-load, use either:
```dart
// In loading screen or a root stateful widget
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(microseconds: 1), () async {
      await context.read<ThemeProvider>().initTheme();
    });
  }
// Or a FutureBuilder which relies on the promise
```