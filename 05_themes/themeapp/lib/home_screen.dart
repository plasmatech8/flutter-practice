import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:themeapp/theme_provider.dart';

String capitalize(String s) {
  return "${s[0].toUpperCase()}${s.substring(1)}";
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    context.read<ThemeProvider>().toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    String themeName =
        capitalize(context.watch<ThemeProvider>().themeMode.toString().split('.')[1]);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Theme is: ${themeName}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
