import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:my_first_flutter/helpers/utils.dart';
import 'package:my_first_flutter/style/index.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// request && model
import 'package:my_first_flutter/request/index.dart';
import 'package:my_first_flutter/home/model/banner_list_model.dart';

enum BannerType {
  TOP,
  MIDDLE,
}

class Banners extends StatefulWidget {
  final BannerType bannerType;

  Banners({this.bannerType});

  @override
  _BannersState createState() => new _BannersState(bannerType: this.bannerType);
}

class _BannersState extends State<Banners> {
  final BannerType bannerType;
  BannerListModel _bannerList;

  _BannersState({this.bannerType});

  void getBannerList() async {
    final Map res = await HttpRequest.queryBannerListModel.setParams(payload: {
      "airportCode": Utils.getAirportInfo().airportCode,
      "bannerType": Utils.enumToString(BannerType.values[this.bannerType.index],
          toLowerCase: true),
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
      height: this.bannerType == BannerType.TOP ? $.px(140) : $.px(90),
      margin: EdgeInsets.only(
        left: $.px(12),
        right: $.px(12),
        bottom: $.px(10),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: this._bannerList != null &&
                  this._bannerList?.bannerList?.length != 0
              ? Swiper(
                  autoplay: true,
                  loop: this._bannerList.bannerList.length > 1 ? true : false,
                  itemCount: this._bannerList.bannerList.length,
                  itemBuilder: (BuildContext context, int index) => SizedBox(
                    width: $.px(351),
                    child: CachedNetworkImage(
                      imageUrl: this._bannerList.bannerList[index].bannerImage,
                      placeholder: (BuildContext context, String url) =>
                          Image.asset('images/banner_placeholder.png',
                              fit: BoxFit.cover),
                      fit: BoxFit.cover,
                    ),
                  ),
                  pagination: this._bannerList.bannerList.length > 1
                      ? new SwiperCustomPagination(
                          builder: (BuildContext context,
                                  SwiperPluginConfig config) =>
                              Container(
                            height: this.bannerType == BannerType.TOP
                                ? $.px(136)
                                : $.px(86),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: List.generate(
                                      this._bannerList.bannerList.length,
                                      (value) => value++)
                                  .map(
                                    (it) => Container(
                                      height: $.px(3),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      decoration: BoxDecoration(
                                        color: config.activeIndex == it
                                            ? Color.fromRGBO(255, 255, 255, 1)
                                            : Color.fromRGBO(
                                                255, 255, 255, 0.4),
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
                          ),
                        )
                      : null,
                )
              : null),
    );
  }
}
