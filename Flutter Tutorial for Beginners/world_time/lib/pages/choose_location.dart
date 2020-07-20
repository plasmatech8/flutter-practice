import 'dart:io';
import 'package:flutter/material.dart';

import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> worldtimes = [
    WorldTime(
        url: 'Europe/London', location: 'London', flag: 'assets/flags/uk.png'),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag: 'assets/flags/greece.png'),
    WorldTime(
        url: 'Africa/Cairo', location: 'Cairo', flag: 'assets/flags/egypt.png'),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'assets/flags/kenya.png'),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'assets/flags/usa.png'),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'assets/flags/usa.png'),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'assets/flags/south_korea.png'),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'assets/flags/indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = worldtimes[index];
    await instance.getTime();
    // Navigate to home screen with data
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
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
      body: ListView.builder(
        itemCount: worldtimes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(worldtimes[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage(worldtimes[index].flag),
              ),
            ),
          );
        },
      ),
    );
  }
}
