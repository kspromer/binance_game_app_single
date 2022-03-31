class AboutUsModel {
  String title;
  String subTitle;

  AboutUsModel({
      this.title, 
      this.subTitle});

  AboutUsModel.fromJson(dynamic json) {
    title = json['title'];
    subTitle = json['subTitle'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['title'] = title;
    map['subTitle'] = subTitle;
    return map;
  }

}