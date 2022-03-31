class SharingChannelsModel {
  String icon;
  String title;

  SharingChannelsModel({
      this.icon, 
      this.title});

  SharingChannelsModel.fromJson(dynamic json) {
    icon = json['icon'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['icon'] = icon;
    map['title'] = title;
    return map;
  }

}