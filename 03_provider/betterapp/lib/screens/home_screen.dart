import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:betterapp/providers/counter_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* App Bar */
      appBar: AppBar(
        title: Text('Provider Example App'),
      ),

      /* Body */
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Count(),
            /* Count in a seperate widget watching the provider state - avoids rebuilding entire widget */
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text('Go to second screen')),
          ],
        ),
      ),

      /* Floating Action Button */
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () => context.read<Counter>().decrement(),
              key: Key('decrement_floatingActionButton'),
              tooltip: 'Decrement',
              child: Icon(Icons.remove)),
          SizedBox(width: 10.0),
          FloatingActionButton(
              onPressed: () => context.read<Counter>().reset(),
              key: Key('reset_floatingActionButton'),
              tooltip: 'Reset',
              child: Icon(Icons.exposure_zero)),
          SizedBox(width: 10.0),
          FloatingActionButton(
              onPressed: () => context.read<Counter>().increment(),
              key: Key('increment_floatingActionButton'),
              tooltip: 'Increment',
              child: Icon(Icons.add)),
        ],
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<Counter>().count}',
      key: Key('counterState'),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
