
class EthLuckyBetDataResultsModel {
  int niuniu;
  int bet1;

  EthLuckyBetDataResultsModel({
    this.niuniu,
    this.bet1});

  EthLuckyBetDataResultsModel.fromJson(dynamic json) {
    niuniu = json['NIU_NIU'];
    bet1 = json['BET_1'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['NIU_NIU'] = niuniu;
    map['BET_1'] = bet1;
    return map;
  }

}
