import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';

import 'package:my_first_flutter/helpers/utils.dart';

class HeaderInterface {
  String uid;
  String appId;
  String token;
  int deviceType;
  String version;
  String clientIp;
  String deviceId;
  String timestamp;
  String requestId;
  String clientName;
  String customerData;
  String clientVersion;
  String channelSource;

  HeaderInterface(
      {this.uid,
      this.appId,
      this.token,
      this.version,
      this.clientIp,
      this.deviceId,
      this.timestamp,
      this.deviceType,
      this.requestId,
      this.clientName,
      this.customerData,
      this.clientVersion,
      this.channelSource});

  HeaderInterface.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    appId = json['appId'];
    token = json['token'];
    version = json['version'];
    clientIp = json['clientIp'];
    deviceId = json['deviceId'];
    timestamp = json['timestamp'];
    requestId = json['requestId'];
    deviceType = json['deviceType'];
    clientName = json['clientName'];
    customerData = json['customerData'];
    clientVersion = json['clientVersion'];
    channelSource = json['channelSource'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['appId'] = this.appId;
    data['token'] = this.token;
    data['version'] = this.version;
    data['clientIp'] = this.clientIp;
    data['deviceId'] = this.deviceId;
    data['requestId'] = this.requestId;
    data['timestamp'] = this.timestamp;
    data['deviceType'] = this.deviceType;
    data['clientName'] = this.clientName;
    data['customerData'] = this.customerData;
    data['clientVersion'] = this.clientVersion;
    data['channelSource'] = this.channelSource;
    return data;
  }
}

class RequestInterface {
  dynamic request;
  HeaderInterface header;

  RequestInterface({
    this.header,
    this.request,
  });

  RequestInterface.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    request = json['request'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request'] = this.request;
    data['header'] = this.header.toJson();
    return data;
  }
}

class ResponseInterface {
  dynamic resultData;
  String errMsg;
  String resultCode;

  ResponseInterface(
      {this.resultCode = '-99', this.errMsg = '内部错误，返回异常', this.resultData});

  ResponseInterface.fromJson(Map<String, dynamic> json) {
    errMsg = json['errMsg'];
    resultCode = json['resultCode'];
    resultData = json['resultData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errMsg'] = this.errMsg;
    data['resultCode'] = this.resultCode;
    data['resultData'] = this.resultData;
    return data;
  }
}

class BaseModel {
  BaseModel(
    String uri,
  ) {
    this.uri = uri;
  }

  String uri = '';
  Dio _dioInstance;
  ResponseInterface _response;
  RequestInterface _params = RequestInterface.fromJson(
      {'header': HeaderInterface.fromJson({}), 'request': {}});

  void _generateModuleInstance() {
    _dioInstance = new Dio();
    _dioInstance.options.baseUrl = 'https://gateway.iskytrip.com/api';

    this._interceptors();
  }

  void _interceptors() {
    _dioInstance.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        print('- - - - - - - - - - START ${this._dioInstance.options.baseUrl + this.uri} - - - - - - - - - -');
        print('【dio】【 ${Utils.dateformat(new DateTime.now().millisecondsSinceEpoch)}】${this._params.toJson().toString()}');
        return options;
      },
      onResponse: (response) async {
        print('- - - - - - - - - - END ${this._dioInstance.options.baseUrl + this.uri} - - - - - - - - - -');
        this._response = ResponseInterface.fromJson(response.data);

        print('【dio】【 ${Utils.dateformat(new DateTime.now().millisecondsSinceEpoch)}】${this._response.toJson().toString()}');
        return response;
      },
      // onError: (DioError error) {
      // },
    ));
  }

  dataformat(json) {
    ResponseInterface result = ResponseInterface.fromJson(json.data);

    if (result.resultCode != '0') {
      print(result.errMsg);
    }
    return result.resultData;
  }

  _generateHeader() {
    return /*{
      "appId": "60101",
      "channelSource": "100",
      "clientName": "在机场plus微信小程序",
      "clientVersion": "2.0.1.1",
      "customerData": "",
      "deviceType": "3",
      "timestamp": new DateTime.now().millisecondsSinceEpoch,
      "token": "100_7ab172489672e7559f1e6823578215cb",
      "uid": 1436,
      "version": "v1.0.0"
    };*/
        {
      "clientIp": "",
      "uid": "1436",
      "channelSource": "101",
      "clientName": "ios",
      "clientVersion": "2.0.1",
      "timestamp": new DateTime.now().millisecondsSinceEpoch.toString(),
      "appId": "60103",
      "deviceId": "13C51C36-5981-46E5-A61A-17DA3E9B7521",
      "deviceType": 2,
      "requestId": "",
      "version": "1.0",
      "token": "100_7ab172489672e7559f1e6823578215cb",
      "customerData": ""
    };
  }

  BaseModel setParams({dynamic payload = ''}) {
    _params.request = payload;
    return this;
  }

  Future execute() async {
    this._generateModuleInstance();
    this._params.header = HeaderInterface.fromJson(this._generateHeader());
    final res = await _dioInstance.post('${this.uri}', data: this._params);
    return this.dataformat(res);
  }
}
