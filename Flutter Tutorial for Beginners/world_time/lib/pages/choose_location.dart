import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print('initState function ran');
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
        title: Text('Choose a Location'),
      ),
      body: RaisedButton(
          onPressed: () {
            setState(() => counter++);
          },
          child: Text('Counter is $counter')),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose function ran');
  }
}
