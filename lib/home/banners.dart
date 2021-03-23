import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:my_first_flutter/helpers/utils.dart';
import 'package:my_first_flutter/style/index.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// request && model
import 'package:my_first_flutter/request/index.dart';
import 'package:my_first_flutter/home/model/banner_list_model.dart';

class Banners extends StatefulWidget {
  @override
  _BannersState createState() => new _BannersState();
}

class _BannersState extends State<Banners> {
  BannerListModel _bannerList;

  void getBannerList() async {
    final Map res = await HttpRequest.queryBannerListModel.setParams(payload: {
      "airportCode": Utils.getAirportInfo().airportCode,
      "bannerType": "top"
    }).execute();

    setState(() {
      _bannerList = BannerListModel.fromJson(res);
    });
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
      margin: EdgeInsets.only(
        left: $.px(12),
        right: $.px(12),
        bottom: $.px(10),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: _bannerList != null && _bannerList?.bannerList?.length != 0
              ? Swiper(
                  itemBuilder: (BuildContext context, int index) => SizedBox(
                    width: $.px(351),
                    child: Image.network(
                      _bannerList.bannerList[index].bannerImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  autoplay: true,
                  itemCount: _bannerList.bannerList.length,
                  pagination: new SwiperCustomPagination(builder:
                      (BuildContext context, SwiperPluginConfig config) {
                    return Container(
                      height: $.px(136),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(2, (value) => value++)
                            .map(
                              (it) => Container(
                                height: $.px(3),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: config.activeIndex == it
                                      ? Color.fromRGBO(255, 255, 255, 1)
                                      : Color.fromRGBO(255, 255, 255, 0.4),
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(2)),
                                ),
                                width: config.activeIndex == it
                                    ? $.px(12)
                                    : $.px(6),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  }),
                )
              : null),
    );
  }
}
