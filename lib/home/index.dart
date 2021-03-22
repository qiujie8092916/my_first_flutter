import 'package:flutter/material.dart';

/// 模块拼接
import './lego.dart';
/// 入口菜单
import './menus.dart';
/// 头部导航
import './nav_bar.dart';
/// 顶部轮播图
import './banners.dart';
/// 优惠券直播
import './live.dart';
/// 为你推荐
import './recommend.dart';
/// 行程卡片
import './journey_car.dart';
/// 胶囊轮播
import './capsule_banner.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: Navbar(leadingWidth: MediaQuery.of(context).size.width),
      body: ListView(
        children: [
          Banners(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.add),
        tooltip: 'Add',
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => new _CounterState();
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
  CounterDisplay({this.count = 0});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({@required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('Increment'),
    );
  }
}
