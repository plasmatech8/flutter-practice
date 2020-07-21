import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brew Crew App'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            print('you clicked me!');
          },
          icon: Icon(
            Icons.free_breakfast,
            size: 100,
          ),
        ),
      ),
    );
  }
}
