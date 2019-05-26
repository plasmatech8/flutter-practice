import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.red),
            home: MyHomePage(title: 'Flutter Demo Home Page WOO!'),
        );
    }
}

/// =================================================
/// A home page with a floating button that creates list buttons which navigates to the second page
class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);

    // This widget is the home page of your application. It is stateful, meaning
    // that it has a State object (defined below) that contains fields that affect
    // how it looks.

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".

    final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    int _counter = 0;

    void _incrementCounter() {
        setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        _counter += 1;
        });
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
                itemBuilder: (context, index){
                    return  ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: Text('Name of item'),
                        onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
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
                    onPressed: (){ Navigator.pop(context); },
                    label: Text("Go back!"),
                    icon: new Icon(FontAwesomeIcons.stepBackward)
                ),
            ),
        );
    }
}