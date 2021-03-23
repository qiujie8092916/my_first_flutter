import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
  NavigationListModel _navigations;

  void queryNavigationList() async {
    final Map res =
        await HttpRequest.queryNavigationListModel.setParams(payload: {
      "airportCode": Utils.getAirportInfo().airportCode,
    }).execute();

    print(json.encode(res));

    setState(() {
      _navigations = NavigationListModel.fromJson(res);
    });
  }

  @override
  void initState() {
    super.initState();
    this.queryNavigationList();
  }

  @override
  Widget build(BuildContext context) {
    final $ = Styles(context);

    return Column(
      children: [
        (_navigations != null && _navigations.navigationList.length != 0)
            ? Row(
                children: _navigations.navigationList
                    .map(
                      (navigation) => SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        height: $.px(80),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              child: Image.network(
                                navigation.openFlag == 'open'
                                    ? navigation.navigationIcon
                                    : navigation.navigationInvalidIcon,
                                height: $.px(50),
                                width: $.px(50),
                              ),
                            ),
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
            ? Swiper(
                loop: false,
                autoplay: false,
                itemCount: _navigations.functionNavigationList.length,
                itemBuilder: (BuildContext context, int index) => Wrap(
                      children: _navigations.functionNavigationList
                          .map((i) => SizedBox(
                                width: MediaQuery.of(context).size.width / 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 4),
                                      child: Image.network(
                                        _navigations
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
                                        height: $.px(25),
                                        width: $.px(25),
                                        fit: BoxFit.cover,
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
                    ))
            : null
      ].where((element) => element != null).toList(),
    );
  }
}
