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

    String bgImage = data['isDaytime'] ? 'assets/day.png' : 'assets/night.png';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
        leading: Container(), // No back buttton
        title: Text('Home Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chooselocation');
                  },
                  icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                  label: Text(
                    'Edit location',
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
