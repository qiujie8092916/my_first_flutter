class NavigationListModel {
  List<NavigationList> navigationList;
  List<NavigationList> functionNavigationList;

  NavigationListModel({this.navigationList, this.functionNavigationList});

  NavigationListModel.fromJson(Map<String, dynamic> json) {
    if (json['navigationList'] != null) {
      navigationList = new List<NavigationList>();
      json['navigationList'].forEach((v) {
        navigationList.add(new NavigationList.fromJson(v));
      });
    }
    if (json['functionNavigationList'] != null) {
      functionNavigationList = new List<NavigationList>();
      json['functionNavigationList'].forEach((v) {
        functionNavigationList.add(new NavigationList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.navigationList != null) {
      data['navigationList'] =
          this.navigationList.map((v) => v.toJson()).toList();
    }
    if (this.functionNavigationList != null) {
      data['functionNavigationList'] =
          this.functionNavigationList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NavigationList {
  int navigationMenuId;
  String navigationType;
  String navigationName;
  String navigationFrontTitle;
  String navigationIcon;
  String navigationInvalidIcon;
  String navigationUrl;
  String openFlag;
  String disMsg;
  String cornerMarker;
  String buryPoint;

  NavigationList(
      {this.navigationMenuId,
        this.navigationType,
        this.navigationName,
        this.navigationFrontTitle,
        this.navigationIcon,
        this.navigationInvalidIcon,
        this.navigationUrl,
        this.openFlag,
        this.disMsg,
        this.cornerMarker,
        this.buryPoint});

  NavigationList.fromJson(Map<String, dynamic> json) {
    navigationMenuId = json['navigationMenuId'];
    navigationType = json['navigationType'];
    navigationName = json['navigationName'];
    navigationFrontTitle = json['navigationFrontTitle'];
    navigationIcon = json['navigationIcon'];
    navigationInvalidIcon = json['navigationInvalidIcon'];
    navigationUrl = json['navigationUrl'];
    openFlag = json['openFlag'];
    disMsg = json['disMsg'];
    cornerMarker = json['cornerMarker'] ?? null;
    buryPoint = json['buryPoint'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['navigationMenuId'] = this.navigationMenuId;
    data['navigationType'] = this.navigationType;
    data['navigationName'] = this.navigationName;
    data['navigationFrontTitle'] = this.navigationFrontTitle;
    data['navigationIcon'] = this.navigationIcon;
    data['navigationInvalidIcon'] = this.navigationInvalidIcon;
    data['navigationUrl'] = this.navigationUrl;
    data['openFlag'] = this.openFlag;
    data['disMsg'] = this.disMsg;
    data['cornerMarker'] = this.cornerMarker;
    data['buryPoint'] = this.buryPoint;
    return data;
  }
}