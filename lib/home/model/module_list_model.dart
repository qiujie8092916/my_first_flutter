class ModuleListModel {
  List<DataList> dataList;

  ModuleListModel({this.dataList});

  ModuleListModel.fromJson(Map<String, dynamic> json) {
    if (json['dataList'] != null) {
      dataList = new List<DataList>();
      json['dataList'].forEach((v) {
        dataList.add(new DataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataList != null) {
      data['dataList'] = this.dataList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataList {
  String title;
  String subTitle;
  String img;
  String url;
  int orderNum;
  String buryPoint;

  DataList(
      {this.title,
        this.subTitle,
        this.img,
        this.url,
        this.orderNum,
        this.buryPoint});

  DataList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    img = json['img'];
    url = json['url'];
    orderNum = json['orderNum'];
    buryPoint = json['buryPoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['img'] = this.img;
    data['url'] = this.url;
    data['orderNum'] = this.orderNum;
    data['buryPoint'] = this.buryPoint;
    return data;
  }
}