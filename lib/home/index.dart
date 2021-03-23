import 'package:flutter/material.dart';
import 'package:my_first_flutter/style/index.dart';
import 'package:my_first_flutter/icons/Iconfont.dart';

/// 模块拼接
import './lego.dart';

/// 入口菜单
import './menus.dart';

/// 顶部轮播图
import './banners.dart';

/// 优惠券直播
import './live.dart';

/// 为你推荐
import './recommend.dart';

/// 行程卡片
// import './journey_car.dart';

/// 胶囊轮播
import './capsule_banner.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final $ = Styles(context);

    return new Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 246, 1),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 44,
        titleSpacing: 12.0,
        backgroundColor:Color.fromRGBO(244, 245, 246, 1),
        title: GestureDetector(
          onTap: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/location/location.png',
                  width: 24.0, height: 24.0),
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  '上海虹桥',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(41, 43, 53, 1),
                  ),
                ),
              ),
              Icon(
                Iconfont.IconjiantouXia,
                size: 12.0,
                color: Color.fromRGBO(41, 43, 53, 1),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.only(right: 12.0),
                  child: Image.asset('images/message/message.png',
                      width: 24.0, height: 24.0),
                ),
              ],
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Banners(),
          Menus(),
          // Journey(),
          Modules(),
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
