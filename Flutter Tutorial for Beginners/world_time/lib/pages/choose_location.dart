import 'dart:io';

import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    // Simulate network request to get a username
    String username = await Future.delayed(Duration(seconds: 2), () {
      print('Simulated async network request');
      return 'yoshi';
    });

    // Simulate network request to get bio using username
    // (breaks if no await above because username is null)
    String bio = await Future.delayed(Duration(seconds: 1), () {
      print('Simulated async network request');
      return 'bio for $username';
    });

    // This runs immediately if no awaiting is performed
    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    print('initState function ran');
    getData();
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
