import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
        leading: Container(), // No back buttton
        title: Text('Home Page'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('Home screen', style: TextStyle(fontSize: 30)),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/chooselocation');
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit location'),
            ),
          ],
        ),
      ),
    );
  }
}
