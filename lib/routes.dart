import 'package:flutter/material.dart';

import 'package:my_first_flutter/home/home.dart';
import 'package:my_first_flutter/randomWords/index.dart';
import 'package:my_first_flutter/layout/index.dart';
import 'package:my_first_flutter/iskytrip/index.dart';

class Routes extends StatefulWidget {
  @override
  createState() => new RouteImpl();
}

class RouteImpl extends State<Routes> {
  int _selectedIndex = 0;

  final tabPages = [HomePage(), RandomWordsPage(), LayoutPage(), IskytripDemo()];

  final List<BottomNavigationBarItem> bottomNavigationBars = [
    BottomNavigationBarItem(icon: new Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: new Icon(Icons.business), label: ''),
    BottomNavigationBarItem(icon: new Icon(Icons.school), label: ''),
    BottomNavigationBarItem(icon: new Icon(Icons.android_outlined), label: ''),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: tabPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // type: ,
        onTap: _onItemTapped,
        fixedColor: Colors.blue,
        items: bottomNavigationBars,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
