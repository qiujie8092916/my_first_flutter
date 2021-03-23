import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:my_first_flutter/style/index.dart';
import 'package:my_first_flutter/helpers/utils.dart';

/// request && model
import 'package:my_first_flutter/request/index.dart';
import './model/home_travel_model.dart';

class Journey extends StatefulWidget {
  @override
  _JourneyState createState() => new _JourneyState();
}

class _JourneyState extends State<Journey> {
  double _scrollXOffset = 0;
  HomeTravelModel _homeTravel;

  void queryNavigationList() async {
    final Map res =
    await HttpRequest.queryUserTravelList.setParams(payload: {
      "airportCode": Utils.getAirportInfo().airportCode,
    }).execute();

    setState(() {
      _homeTravel = HomeTravelModel.fromJson(res);
    });
  }

  @override
  void initState() {
    super.initState();

    /// 获取行程数据
    this.queryNavigationList();
  }

  @override
  Widget build(BuildContext context) {
    final $ = Styles(context);

    return Container();
  }
}
