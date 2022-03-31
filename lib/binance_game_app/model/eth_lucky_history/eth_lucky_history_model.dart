class EthLuckyHistoryModel {
  String betType;
  bool valid;

  EthLuckyHistoryModel({
      this.betType,
      this.valid});

  EthLuckyHistoryModel.fromJson(dynamic json) {
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
