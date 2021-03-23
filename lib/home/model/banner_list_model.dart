class BannerListModel {
  List<BannerList> bannerList;

  BannerListModel({this.bannerList});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    if (json['bannerList'] != null) {
      bannerList = new List<BannerList>();
      json['bannerList'].forEach((v) {
        bannerList.add(new BannerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerList {
  int homeBannerId;
  String bannerTitle;
  String bannerDesc;
  String bannerType;
  String bannerImage;
  String shareIcon;
  String jumpUrl;
  int orderNum;

  BannerList(
      {this.homeBannerId,
        this.bannerTitle,
        this.bannerDesc,
        this.bannerType,
        this.bannerImage,
        this.shareIcon,
        this.jumpUrl,
        this.orderNum});

  BannerList.fromJson(Map<String, dynamic> json) {
    homeBannerId = json['homeBannerId'];
    bannerTitle = json['bannerTitle'];
    bannerDesc = json['bannerDesc'];
    bannerType = json['bannerType'];
    bannerImage = json['bannerImage'];
    shareIcon = json['shareIcon'];
    jumpUrl = json['jumpUrl'];
    orderNum = json['orderNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['homeBannerId'] = this.homeBannerId;
    data['bannerTitle'] = this.bannerTitle;
    data['bannerDesc'] = this.bannerDesc;
    data['bannerType'] = this.bannerType;
    data['bannerImage'] = this.bannerImage;
    data['shareIcon'] = this.shareIcon;
    data['jumpUrl'] = this.jumpUrl;
    data['orderNum'] = this.orderNum;
    return data;
  }
}