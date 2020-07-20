import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Display name
  String flag; // Flag asset URL
  String url; // API endpoint
  String time;

  WorldTime({this.location, this.flag, this.url}) {
    getTime();
  }

  Future<void> getTime() async {
    try {
      // Make request
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(res.body);

      // Get properties
      String datetime = data['datetime']; // '2020-07-19T15:07:55.000185+10:00'
      String offset = data['utc_offset'].substring(0, 3); // '+10:00'

      // Get datetime
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now); // Human readable time (using intl)
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data!!!';
    }
  }
}
