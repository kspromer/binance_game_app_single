class BtcLuckyBettypeGetModel {
  String betType;
  int bet;
  int top;

  BtcLuckyBettypeGetModel({
      this.betType,
      this.bet,
      this.top});

  BtcLuckyBettypeGetModel.fromJson(dynamic json) {
    betType = json['betType'];
    bet = json['bet'];
    top = json['top'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['betType'] = betType;
    map['bet'] = bet;
    map['top'] = top;
    return map;
  }

}
