import 'package:flutter/material.dart';

import 'package:authapp/screens/home_screen.dart';
import 'package:authapp/screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addObserver(this);
  }

  @override
  void dispose() {
    WidgetsFlutterBinding.ensureInitialized().removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
    if (state == AppLifecycleState.resumed) {
      print('resmued');
      //Navigator.popAndPushNamed(context, 'dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', initialRoute: '/', routes: {
      '/': (context) => HomePage(),
      '/dashboard': (context) => DashboardPage(),
    });
  }
}
