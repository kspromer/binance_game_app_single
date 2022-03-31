
class EthLuckyBetDataBetItemvosModel {
  String betType;
  int bet;
  int result;

  EthLuckyBetDataBetItemvosModel({
    this.betType,
    this.bet,
    this.result});

  EthLuckyBetDataBetItemvosModel.fromJson(dynamic json) {
    betType = json['betType'];
    bet = json['bet'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['betType'] = betType;
    map['bet'] = bet;
    map['result'] = result;
    return map;
  }

}
