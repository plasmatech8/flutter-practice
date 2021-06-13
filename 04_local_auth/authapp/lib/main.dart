import 'package:flutter/material.dart';

import 'package:authapp/screens/home_screen.dart';
import 'package:authapp/screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', initialRoute: '/', routes: {
      '/': (context) => HomePage(),
      '/dashboard': (context) => DashboardPage(),
    });
  }
}
