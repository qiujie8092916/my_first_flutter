import 'package:flutter/material.dart';

import 'package:my_first_flutter/icons/Iconfont.dart';

PreferredSizeWidget Navbar({double leadingWidth = 40.0}) => AppBar(
        elevation: 0,
        toolbarHeight: 44,
        leadingWidth: leadingWidth,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: GestureDetector(
          onTap: null,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: new EdgeInsets.only(left: 24.0),
                child: Image.asset('images/location/location.png',
                    width: 24.0, height: 24.0),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  '上海虹桥',
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
              children: [
                Container(
                  margin: new EdgeInsets.only(right: 24.0),
                  child: Image.asset('images/message/message.png',
                      width: 24.0, height: 24.0),
                ),
              ],
            ),
          )
        ]);
