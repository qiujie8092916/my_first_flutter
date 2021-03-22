import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:my_first_flutter/style/index.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:my_first_flutter/request/index.dart';

import 'package:my_first_flutter/home/model/Banner_list_model.dart';

class Banners extends StatefulWidget {
  @override
  _BannersState createState() => new _BannersState();
}

class _BannersState extends State<Banners> {
  BannerListModel _bannerList;

  void getBannerList() async {
    final Map res = await HttpRequest.queryBannerListModel.setParams(
        payload: {"airportCode": "SHA", "bannerType": "top"}).execute();

    print(json.encode(res));

    setState(() {
      _bannerList = BannerListModel.fromJson(res);
    });
    print(MediaQuery.of(context).size);
  }

  @override
  void initState() {
    super.initState();
    this.getBannerList();
  }

  @override
  Widget build(BuildContext context) {
    final $ = Styles(context);

    return Container(
        height: $.px(140),
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _bannerList != null && _bannerList?.bannerList?.length != 0
                ? Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Wrap(
                        children: _bannerList.bannerList.map((bannerItem) {
                          return Image.network(
                            bannerItem.bannerImage,
                            fit: BoxFit.cover,
                          );
                        }).toList(),
                      );
                    },
                    autoplay: true,
                    itemCount: _bannerList.bannerList.length,
                    pagination: new SwiperPagination(),
                  )
                : null));
  }
}
