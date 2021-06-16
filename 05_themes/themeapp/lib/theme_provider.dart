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
