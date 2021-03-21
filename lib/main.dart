import 'package:flutter/material.dart';

import 'package:my_first_flutter/routes.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new Routes(),
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(255, 206, 0, 1),
        scaffoldBackgroundColor: Colors.white,
        // primarySwatch: Colors.blue,
      ),
    );
  }
}