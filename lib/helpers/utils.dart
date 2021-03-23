import 'package:my_first_flutter/helpers/airport_info_model.dart';

class Utils {
  static AirportInfo _airportInfo = AirportInfo.fromJson({
    "groupTitle": "热门机场",
    "airportCode": "PVG",
    "airportName": "上海浦东国际机场",
    "webShortName": "上海浦东国际机场",
    "cityId": 73,
    "cityName": "上海市",
    "cityEName": "shanghai",
    "cityPinyin": "shanghai",
    "countryId": 1,
    "countryName": "中国",
    "shortname": "上海浦东",
    "ename": "Pudong International Airport",
    "airportTel": "139999999",
    "airportAddr": "浦东南汇",
    "openIskytrip": 1,
    "openArFlg": 0,
    "internalFlg": "D",
    "queryCityFlg": 0,
    "googleLat": 31.157478,
    "googleLon": 121.81509,
    "baiduLat": 31.157478,
    "baiduLon": 121.81509,
    "amapLat": 31.203347,
    "amapLon": 121.81509,
    "isHot": 1
  });

  static AirportInfo getAirportInfo() {
    return Utils._airportInfo;
  }
}
