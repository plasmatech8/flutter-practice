import 'package:flutter/material.dart';

import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading...';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Melbourne',
      flag: 'australia.png',
      url: 'Australia/Melbourne',
    );
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
