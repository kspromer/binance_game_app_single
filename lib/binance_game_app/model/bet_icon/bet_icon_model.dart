class BetIconModel {
  String text;
  double value;
  String url;
  String selectUrl;
  var style;

  BetIconModel({
      this.text, 
      this.url,
      this.value,
      this.selectUrl,
      this.style});

  BetIconModel.fromJson(dynamic json) {
    text = json["text"];
    url = json["url"];
    style = json["style"];
    value = json["value"];
    selectUrl = json["selectUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["text"] = text;
    map["url"] = url;
    map["style"] = style;
    map["value"] = value;
    map["selectUrl"] = selectUrl;
    return map;
  }

}