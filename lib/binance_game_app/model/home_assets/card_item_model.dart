
class CardItemModel {
  String icon;
  String title;
  String routerName;

  CardItemModel({
      this.icon, 
      this.title,
      this.routerName});

  CardItemModel.fromJson(dynamic json) {
    icon = json["icon"];
    title = json["title"];
    routerName = json["routerName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["icon"] = icon;
    map["title"] = title;
    map["routerName"] = routerName;
    return map;
  }

}