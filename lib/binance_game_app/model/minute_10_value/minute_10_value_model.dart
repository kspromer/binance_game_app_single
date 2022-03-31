class Minute10ValueModel {
  String niu;
  bool bet1;
  bool bet2;

  Minute10ValueModel({
      this.niu,
      this.bet1,
      this.bet2});

  Minute10ValueModel.fromJson(dynamic json) {
    niu = json['niu'];
    bet1 = json['bet1'];
    bet2 = json['bet2'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['niu'] = niu;
    map['bet1'] = bet1;
    map['bet2'] = bet2;
    return map;
  }

}
