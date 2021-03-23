import 'package:my_first_flutter/base/base_model.dart';

class HttpRequest {
  static BaseModel queryBannerListModel = BaseModel('/wireless/appHome/queryBannerList');

  static BaseModel queryNavigationListModel = BaseModel('/wireless/appHome/queryNavigationList');
  
  static BaseModel queryUserTravelList = BaseModel('/productflight/flight-follow/queryUserTravelList');

  static BaseModel queryModuleList = BaseModel('/wireless/appHome/getFixedModule');
}