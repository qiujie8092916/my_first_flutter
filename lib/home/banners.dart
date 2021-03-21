import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/home/model/banner_list_model.dart';

import 'package:my_first_flutter/request/index.dart';

import './model/banner_list_model.dart';

class Banners extends StatefulWidget {
  @override
  _BannersState createState() => new _BannersState();
}

class _BannersState extends State<Banners> {
  BannerListModel _bannerList = [];

  void getBannerList() async {
      final Map res = await HttpRequest.queryBannerListModel.setParams(
          payload: {"airportCode": "SHA", "bannerType": "top"}).execute();

      // setState(() {
      //   _bannerList = (res['bannerList']);
      // });
  }

  @override
  void initState() {
    super.initState();
    this.getBannerList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(); //Swiper();
  }
}
