// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:my_first_flutter/home/index.dart';
import 'package:my_first_flutter/randomWords/index.dart';
import 'package:my_first_flutter/layout/index.dart';
import 'package:my_first_flutter/iskytrip/index.dart';

typedef void TabbarItemOnTap(int index);

class Routes extends StatefulWidget {
  @override
  createState() => new RouteImpl();
}

class RouteImpl extends State<Routes> {
  int _selectedIndex = 0;

  final tabPages = [
    HomePage(),
    RandomWordsPage(),
    LayoutPage(),
    IskytripDemo(),
    IskytripDemo()
  ];

  final List<BottomNavBarItem> bottomNavBarItems = [
    BottomNavBarItem(icon: 'home', label: '首页'),
    BottomNavBarItem(icon: 'shop', label: '商城'),
    BottomNavBarItem(icon: 'onAirport', label: '在机场'),
    BottomNavBarItem(icon: 'trip', label: '行程'),
    BottomNavBarItem(icon: 'mine', label: '我的'),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabPages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: BottomNavBar(
          onTap: _onItemTapped,
          items: bottomNavBarItems,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}

class BottomNavBarItem {
  const BottomNavBarItem({
    this.icon = '',
    this.label = '',
  });

  final String icon;
  final String label;
}

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
  });

  final int currentIndex;
  final TabbarItemOnTap onTap;
  final List<BottomNavBarItem> items;

  @override
  _TabbarItemState createState() => _TabbarItemState(
        this.items,
        this.currentIndex,
        this.onTap,
      );
}

class _TabbarItemState extends State<BottomNavBar> {
  _TabbarItemState(this.items, this.currentIndex, this.onTap);

  List<bool> _isTapUp = <bool>[];

  final int currentIndex;
  final TabbarItemOnTap onTap;
  final List<BottomNavBarItem> items;

  int get itemsLen => items.length;

  void _resetState() {
    setState(() {
      _isTapUp = List.generate(itemsLen, (_) => false);
    });
  }

  void _handleTapUp(int index) {
    setState(() {
      for (int i = 0; i < widget.items.length; i++) {
        _isTapUp[i] = i == index;
      }
    });
  }

  List<Widget> _createTiles() {
    final List<Widget> tiles = <Widget>[];
    double itemWidth = MediaQuery.of(context).size.width / 5;

    for (int i = 0; i < widget.items.length; i++) {
      final bool _isSelected = widget.currentIndex == i;

      tiles.add(GestureDetector(
        onTap: () {
          widget.onTap(i);
        },
        onTapUp: (TapUpDetails details) {
          _handleTapUp(i);
        },
        child: SizedBox(
          height: 49,
          width: itemWidth,
          child: Container(
            margin: new EdgeInsets.only(top: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                generateTabbarIcon(i, _isSelected),
                Container(
                  margin: new EdgeInsets.only(top: 1.0),
                  child: Text('${widget.items[i].label}',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight:
                            _isSelected ? FontWeight.bold : FontWeight.w400,
                        color: _isSelected
                            ? Color.fromRGBO(255, 195, 0, 1)
                            : Color.fromRGBO(102, 102, 102, 1),
                      )),
                )
              ],
            ),
          ),
        ),
      ));
    }

    return tiles;
  }

  Image generateTabbarIcon(int i, bool selected) {
    final _snippet = selected ? 'sele' : 'normal';

    return Image.asset(
      // _isTapUp[i]
      //     ? 'images/bottomNavigationBar/tab_${widget.items[i].icon}_sele.imageset/${widget.items[i].icon}_gif.gif'
      //     : 'images/bottomNavigationBar/tab_${widget.items[i].icon}_${_snippet}.imageset/${widget.items[i].icon}.png',
      'images/bottomNavigationBar/tab_${widget.items[i].icon}_${_snippet}.imageset/${widget.items[i].icon}.png',
      width: 27,
      height: 27,
      fit: BoxFit.cover,
    );
  }

  @override
  void initState() {
    super.initState();
    _resetState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _createTiles(),
    );
  }
}
