class BetconfigModel {
  int id;
  String point;
  double odds;

  BetconfigModel({
      this.id, 
      this.point, 
      this.odds});

  BetconfigModel.fromJson(dynamic json) {
    id = json['id'];
    point = json['point'];
    odds = json['odds'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['point'] = point;
    map['odds'] = odds;
    return map;
  }

}