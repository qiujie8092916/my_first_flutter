import 'package:my_first_flutter/base/base_model.dart';

class HttpRequest {
  static BaseModel get queryBannerListModel => BaseModel('/wireless/appHome/queryBannerList');

  static BaseModel get queryNavigationListModel => BaseModel('/wireless/appHome/queryNavigationList');
  
  static BaseModel get queryUserTravelList => BaseModel('/productflight/flight-follow/queryUserTravelList');

  static BaseModel get queryModuleList => BaseModel('/wireless/appHome/getFixedModule');
}