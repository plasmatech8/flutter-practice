import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('asdasdas'),
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              onPressed: () => print('Woo'),
              child: Text('Woo'),
            ),
          ),
        ));
  }
}
