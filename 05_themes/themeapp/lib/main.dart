import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:themeapp/theme_provider.dart';
import 'package:themeapp/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: context.watch<ThemeProvider>().themeMode,
      theme: ThemeProvider.lightTheme,
      darkTheme: ThemeProvider.darkTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
