import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'banner_list_model.g.dart';

class BannerItem{
  const BannerItem({this.homeBannerId = 0, this.jumpUrl = '', this.bannerImage = ''});

  final int homeBannerId;
  final String jumpUrl;
  final String bannerImage;
}

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class BannerListModel {
  List<BannerItem> bannerList = [];

  BannerListModel(this.bannerList);

  //不同的类使用不同的mixin即可
  factory BannerListModel.fromJson(Map<String, dynamic> json) => _$BannerListModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerListModelToJson(this);
}