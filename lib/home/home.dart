import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: null,
            tooltip: 'Navigation menu',
          ),
          title: new Text('Example title'),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.search),
                tooltip: 'Search',
                onPressed: null),
          ]),
      body: new Counter(),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.add),
        tooltip: 'Add',
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState () => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new CounterDisplay(count: _counter),
        new CounterIncrementor(onPressed: _increment),
      ],
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({ this.count });

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({ this.onPressed });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text(
          'Increment'
      ),
    );
  }
}



