import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(title: 'Flutter Practice!', storage: CounterStorage()),
    );
  }
}

// class GetData {
//     Future<http.Respnse> fetchData(http.Client client) async {
//         // Using get from http.Client
//         return client.get('http://jsonplaceholder.typicode.com/photos')
//     }
// }

class CounterStorage {
  // Gets the working directory
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Get the counter file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  // Read the counter file
  Future<int> readCounter() async {
    // If we find a file, return the number
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return int.parse(contents);
      // Else, return 0
    } catch (e) {
      return 0;
    }
  }

  // Write to the counter file
  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}

/// =================================================
/// A home page with a floating button that creates list buttons which navigates to the second page
class MyHomePage extends StatefulWidget {
  final String title;
  final CounterStorage storage;

  MyHomePage({Key key, this.title, @required this.storage}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // When we initialise the app, counter is set to the stored number
  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() async {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    // Set storage to the counter
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // Top bar
      appBar: AppBar(title: Text(widget.title)),

      // Body
      body: new ListView.builder(
        itemCount: _counter,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text('Name of item'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage()));
            },
          ); // What we want to show multiple times
        },
      ),
      /*
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        ListTile(leading: const Icon(Icons.block), title: const Text("Android")),
                        ListTile(leading: const Icon(Icons.ac_unit), title: const Text("iOS")),
                        ListTile(leading: const Icon(Icons.add_to_queue), title: const Text("Web"))
                    ],
                ),
            ),
            */

      // Floating button
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

/// =================================================
/// A second page with a button to go back.
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top bar
      appBar: AppBar(
        title: Text("Second Screen"),
      ),

      // Body
      body: Center(
        child: RaisedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            label: Text("Go back!"),
            icon: new Icon(FontAwesomeIcons.stepBackward)),
      ),
    );
  }
}
