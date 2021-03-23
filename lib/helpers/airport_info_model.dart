class AirportInfo {
  String groupTitle;
  String airportCode;
  String airportName;
  String webShortName;
  int cityId;
  String cityName;
  String cityEName;
  String cityPinyin;
  int countryId;
  String countryName;
  String shortname;
  String ename;
  String airportTel;
  String airportAddr;
  int openIskytrip;
  int openArFlg;
  String internalFlg;
  int queryCityFlg;
  double googleLat;
  double googleLon;
  double baiduLat;
  double baiduLon;
  double amapLat;
  double amapLon;
  int isHot;

  AirportInfo(
      {this.groupTitle,
        this.airportCode,
        this.airportName,
        this.webShortName,
        this.cityId,
        this.cityName,
        this.cityEName,
        this.cityPinyin,
        this.countryId,
        this.countryName,
        this.shortname,
        this.ename,
        this.airportTel,
        this.airportAddr,
        this.openIskytrip,
        this.openArFlg,
        this.internalFlg,
        this.queryCityFlg,
        this.googleLat,
        this.googleLon,
        this.baiduLat,
        this.baiduLon,
        this.amapLat,
        this.amapLon,
        this.isHot});

  AirportInfo.fromJson(Map<String, dynamic> json) {
    groupTitle = json['groupTitle'];
    airportCode = json['airportCode'];
    airportName = json['airportName'];
    webShortName = json['webShortName'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    cityEName = json['cityEName'];
    cityPinyin = json['cityPinyin'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    shortname = json['shortname'];
    ename = json['ename'];
    airportTel = json['airportTel'];
    airportAddr = json['airportAddr'];
    openIskytrip = json['openIskytrip'];
    openArFlg = json['openArFlg'];
    internalFlg = json['internalFlg'];
    queryCityFlg = json['queryCityFlg'];
    googleLat = json['googleLat'];
    googleLon = json['googleLon'];
    baiduLat = json['baiduLat'];
    baiduLon = json['baiduLon'];
    amapLat = json['amapLat'];
    amapLon = json['amapLon'];
    isHot = json['isHot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupTitle'] = this.groupTitle;
    data['airportCode'] = this.airportCode;
    data['airportName'] = this.airportName;
    data['webShortName'] = this.webShortName;
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    data['cityEName'] = this.cityEName;
    data['cityPinyin'] = this.cityPinyin;
    data['countryId'] = this.countryId;
    data['countryName'] = this.countryName;
    data['shortname'] = this.shortname;
    data['ename'] = this.ename;
    data['airportTel'] = this.airportTel;
    data['airportAddr'] = this.airportAddr;
    data['openIskytrip'] = this.openIskytrip;
    data['openArFlg'] = this.openArFlg;
    data['internalFlg'] = this.internalFlg;
    data['queryCityFlg'] = this.queryCityFlg;
    data['googleLat'] = this.googleLat;
    data['googleLon'] = this.googleLon;
    data['baiduLat'] = this.baiduLat;
    data['baiduLon'] = this.baiduLon;
    data['amapLat'] = this.amapLat;
    data['amapLon'] = this.amapLon;
    data['isHot'] = this.isHot;
    return data;
  }
}