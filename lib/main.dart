import 'package:flutter/material.dart';
import 'package:my_first_flutter/home.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new Home(),
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}