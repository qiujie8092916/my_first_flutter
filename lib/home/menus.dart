import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:my_first_flutter/style/index.dart';
import 'package:my_first_flutter/helpers/utils.dart';

/// request && model
import 'package:my_first_flutter/request/index.dart';
import './model/navigation_list_model.dart';

class Menus extends StatefulWidget {
  @override
  _MenusState createState() => new _MenusState();
}

class _MenusState extends State<Menus> {
  double _scrollXOffset = 0;
  NavigationListModel _navigations;
  ScrollController _controller = new ScrollController();

  void queryNavigationList() async {
    final Map res =
        await HttpRequest.queryNavigationListModel.setParams(payload: {
      "airportCode": Utils.getAirportInfo().airportCode,
    }).execute();

    setState(() {
      _navigations = NavigationListModel.fromJson(res);
    });
  }

  @override
  void initState() {
    super.initState();

    /// 获取菜单数据
    this.queryNavigationList();

    ///监听次菜单栏的横向滑动
    _controller.addListener(() {
      print(_controller.offset); // 打印滚动位置
      setState(() {
        _scrollXOffset = _controller.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var activeOffset;
    final $ = Styles(context);
    final double contextWidth = MediaQuery.of(context).size.width;

    if (_navigations != null &&
        _navigations.functionNavigationList.length != 0) {
      final double scrollWidth =
          _navigations.functionNavigationList.length * (contextWidth / 5) -
              contextWidth;
      activeOffset = _scrollXOffset / scrollWidth * $.px(20);
    }

    return Container(
      margin: EdgeInsets.only(bottom: $.px(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          (_navigations != null && _navigations.navigationList.length != 0)
              ? Row(
                  children: _navigations.navigationList
                      .map(
                        (navigation) => SizedBox(
                          width: contextWidth / 5,
                          // height: $.px(60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(bottom: 4),
                                  child: CachedNetworkImage(
                                    height: $.px(50),
                                    width: $.px(50),
                                    imageUrl: navigation.openFlag == 'open'
                                        ? navigation.navigationIcon
                                        : navigation.navigationInvalidIcon,
                                    placeholder: (BuildContext context,
                                            String url) =>
                                        Image.asset('images/placeholder.png',
                                            fit: BoxFit.cover),
                                    fit: BoxFit.cover,
                                  )),
                              Text(
                                navigation.navigationFrontTitle,
                                style: TextStyle(
                                  fontSize: $.px(12),
                                  height: 1.3333,
                                  color: Color.fromRGBO(41, 43, 53, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                )
              : null,
          (_navigations != null &&
                  _navigations.functionNavigationList?.length != 0)
              ? new Stack(
                  children: [
                  Container(
                    height: $.px(55),
                    margin: const EdgeInsets.only(top: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      children: _navigations.functionNavigationList
                          .asMap()
                          .keys
                          .map((index) => SizedBox(
                                width: contextWidth / 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 4),
                                      child: CachedNetworkImage(
                                        width: $.px(25),
                                        height: $.px(25),
                                        fit: BoxFit.cover,
                                        imageUrl: _navigations
                                                    .functionNavigationList[
                                                        index]
                                                    .openFlag ==
                                                'open'
                                            ? _navigations
                                                .functionNavigationList[index]
                                                .navigationIcon
                                            : _navigations
                                                .functionNavigationList[index]
                                                .navigationInvalidIcon,
                                        placeholder: (BuildContext context,
                                                String url) =>
                                            Image.asset(
                                                'images/placeholder.png',
                                                fit: BoxFit.cover),
                                      ),
                                    ),
                                    Text(
                                      _navigations.functionNavigationList[index]
                                          .navigationFrontTitle,
                                      style: TextStyle(
                                        fontSize: $.px(12),
                                        height: 1.3333,
                                        color: Color.fromRGBO(41, 43, 53, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  _navigations.functionNavigationList.length > 5
                      ? new Positioned(
                          bottom: 0,
                          left: contextWidth / 2 - $.px(20),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(3)),
                            child: Container(
                              width: $.px(40),
                              height: $.px(2),
                              alignment: Alignment.topLeft,
                              color: Color.fromRGBO(
                                  207, 210, 218, 1), //31, 125, 248
                              child: Transform(
                                transform: new Matrix4.identity()
                                  ..translate(activeOffset), //activeOffset
                                child: Container(
                                  width: $.px(20),
                                  height: $.px(2),
                                  color: Color.fromRGBO(
                                      58, 61, 80, 1), //254, 32, 64
                                ),
                              ),
                            ),
                          ),
                        )
                      : null,
                ].where((element) => element != null).toList())
              : null
        ].where((element) => element != null).toList(),
      ),
    );
  }
}
