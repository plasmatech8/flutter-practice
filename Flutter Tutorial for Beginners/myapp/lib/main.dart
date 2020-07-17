import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home4()));

// Buttons and Icons
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            print('you clicked me!');
          },
          color: Colors.amber,
          icon: Icon(Icons.mail),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

// Containers and Padding
class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Container(
        color: Colors.grey[400],
        child: Text('Hello'),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        margin: EdgeInsets.all(2),
      ),
    );
  }
}

// Row and Columns
class Home3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Horizontal space
        crossAxisAlignment: CrossAxisAlignment.start, // Vertical alignmt in row
        children: <Widget>[
          Text('Hello'),
          FlatButton(
            onPressed: () {},
            color: Colors.amber,
            child: Text('click me!'),
          ),
          Container(
            color: Colors.cyan,
            padding: EdgeInsets.all(30),
            child: Text('inside container'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(child: Text('thing 1'), color: Colors.red),
              Container(child: Text('thing 22'), color: Colors.red),
              Container(child: Text('thing 333'), color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}

// Expanded Widgets
class Home4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset('assets/space.png'),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.cyan,
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.pinkAccent,
              child: Text('2'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.amber,
              child: Text('3'),
            ),
          ),
        ],
      ),
    );
  }
}
