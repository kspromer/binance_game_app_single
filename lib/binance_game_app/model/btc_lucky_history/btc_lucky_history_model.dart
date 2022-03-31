class BtcLuckyHistoryModel {
  String betType;
  bool valid;

  BtcLuckyHistoryModel({
      this.betType, 
      this.valid});

  BtcLuckyHistoryModel.fromJson(dynamic json) {
    betType = json['betType'];
    valid = json['valid'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['betType'] = betType;
    map['valid'] = valid;
    return map;
  }

}