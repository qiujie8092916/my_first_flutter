import 'dart:async';
import 'dart:collection';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';

class ResponseFormat {
  const ResponseFormat(
      {this.resultCode = '-99', this.errMsg = '内部错误，返回异常', this.resultData});
  final String resultCode;
  final String errMsg;
  final resultData;
}

class BaseModel {
  BaseModel(
    String uri,
  ) {
    this.uri = uri;
  }

  String uri = '';
  late Dio _dioInstance;
  Map<dynamic, dynamic> _params = {'header': {}, 'request': {}};

  void _generateModuleInstance() {
    _dioInstance = new Dio();
    _dioInstance.options.baseUrl = 'https://gateway.iskytrip.com/api';

    this._interceptors();
  }

  void _interceptors() {
    _dioInstance.interceptors.add(InterceptorsWrapper(
      // onRequest: (RequestOptions options) async {
      // this._generateHeader()
      // return options;
      // },
      // onResponse: (Response<dynamic> response) async {
      //   Map responseFormat;
      //   if (response.data?['resultCode'] == '0') {
      //     responseFormat = response.data?['resultData'];
      //   } else {
      //     print(response.data?['errMsg']);
      //     responseFormat = {};
      //   }
      //   return json.decode(responseFormat.toString());
      // },
      // onError: (DioError error) {
      // },
    ));
  }

  Map dataformat(json) {
    if (json.data?['resultCode'] == '0') {
      return /*json.decode(*/json.data['resultData']/*)*/;
    } else {
      print(json.data?['errMsg']);
      return /*json.decode(*/{}/*)*/;
    }
  }

  _generateHeader() {
    return {
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
    };
  }

  BaseModel setParams({dynamic payload = ''}) {
    _params['request'] = payload;
    return this;
  }

  Future<Map> execute() async {
    this._generateModuleInstance();
    this._params['header'] = this._generateHeader();
    final res = await _dioInstance.post('${this.uri}', data: this._params);
    return this.dataformat(res);
  }
}
