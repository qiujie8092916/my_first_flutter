import 'package:flutter/material.dart';

import 'package:my_first_flutter/layout/favoriteWidget.dart';

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 标题部分
    Widget titleSection = new Container(
      padding:
          const EdgeInsets.only(top: 20, left: 32.0, right: 32.0, bottom: 20),
      child: new Row(
        children: [
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(color: Colors.grey[500]),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          )),
          new FavoriteWidget()
        ],
      ),
    );

    // 创建按钮列
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Colors.blue;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: new EdgeInsets.only(top: 0.8),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          )
        ],
      );
    }

    // 按钮部分
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    // 文本部分
    Widget textSection = new Container(
      padding: new EdgeInsets.all(32),
      child: new Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true),
    );

    return new Scaffold(
        body: new ListView(
      children: [
        new Image.asset(
          'images/lake.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        titleSection,
        buttonSection,
        textSection,
      ],
    ));
  }
}
