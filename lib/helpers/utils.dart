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

  static String dateformat(int timestamp, {String format = 'yyyy-mm-dd hh:ii:ss'}) {
    DateTime _date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String _year = _date.year.toString();

    List _weekCompared = ['日', '一', '二', '三', '四', '五', '六'];
    Map<String,String> o = {
      "w+" : _date.weekday.toString(),                //星期几
      "W+" : _weekCompared[_date.weekday],                //中文星期几
      "m+" : _date.month.toString() ,                 //月份
      "d+" : _date.day.toString(),                    //日
      "h+" : _date.hour.toString(),                   //小时
      "i+" : _date.minute.toString(),                 //分
      "s+" : _date.second.toString(),                 //秒
      "S"  : _date.millisecond.toString()              //毫秒
    };

    if (format.indexOf(new RegExp(r'y+')) > -1) {
      format = format.replaceAllMapped(RegExp(r'y+'), (matches){
        String _temp = '';
        for (var i = 0; i < 4; i++) {
          _temp = _year[4 - i - 1] + _temp;
        }
        return _temp.substring(4 - matches.group(0).length);
      });
    }
    o.forEach((key, val) {
      if(format.indexOf(new RegExp('$key')) > -1) {
        format = format.replaceAllMapped(new RegExp('$key'), (match) {
          return match.group(0).length > 1
              ? (("00" + val.toString()).substring(val.toString().length))
              : val;
        });
      }
    });
    return format;
  }
}
