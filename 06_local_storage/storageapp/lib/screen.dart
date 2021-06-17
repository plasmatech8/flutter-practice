import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json) // NEED TO HANDLE ERRORS
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

class _ScreenState extends State<Screen> {
  // Prefs
  int _counter = 0;
  int _counterField = 0;
  // Secure Storage
  final _storage = new FlutterSecureStorage();
  String _value = "";
  String _valueField = "";
  // Local File
  final _filename = "myfile";
  Map<String, dynamic>? _fileContents;
  Map<String, dynamic> _fileContentsField = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Examples'),
      ),
      body: Container(
        child: ListView(
          children: [
            /* Shared Prefs */
            Text('Shared Prefs', style: Theme.of(context).textTheme.headline3),
            Text('Counter is: $_counter'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() => _counterField = int.tryParse(value) ?? 0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    final counter = prefs.getInt('counter') ?? 0;
                    setState(() => _counter = counter);
                  },
                  child: Text('Read'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setInt('counter', _counterField);
                  },
                  child: Text('Write'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    await preferences.clear();
                  },
                  child: Text('Clear'),
                ),
              ],
            ),
            SizedBox(height: 30),

            /* Secure Storage */
            Text('Secure Storage', style: Theme.of(context).textTheme.headline3),
            Text('Value is: $_value'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    onChanged: (value) => setState(() => _valueField = value),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    String value = await _storage.read(key: 'key') ?? 'Not Set';
                    setState(() => _value = value);
                  },
                  child: Text('Read'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _storage.write(key: 'key', value: _valueField);
                  },
                  child: Text('Write'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _storage.deleteAll();
                  },
                  child: Text('Clear'),
                ),
              ],
            ),

            /* Local File */
            Text('Local File', style: Theme.of(context).textTheme.headline3),
            Text('File Contents is: ${_fileContents.toString()}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    onChanged: (value) => setState(() => _fileContentsField['value'] = value),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final directory = (await getApplicationDocumentsDirectory()).path;
                    final file = File('$directory/$_filename.json');
                    if (!file.existsSync()) {
                      print('File does not exist');
                      setState(() => _fileContents = null);
                      return;
                    }
                    final rawOutput = await file.readAsString();
                    print('reading $rawOutput');
                    try {
                      setState(() => _fileContents = jsonDecode(rawOutput));
                    } on FormatException {
                      print('The provided string is not valid JSON');
                    }
                  },
                  child: Text('Read'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final directory = (await getApplicationDocumentsDirectory()).path;
                    final file = File('$directory/$_filename.json');
                    final rawInput = jsonEncode(_fileContentsField);
                    file.writeAsString(rawInput);
                    print('writing $rawInput');
                  },
                  child: Text('Write'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final directory = (await getApplicationDocumentsDirectory()).path;
                    final file = File('$directory/$_filename.json');
                    await file.delete();
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
