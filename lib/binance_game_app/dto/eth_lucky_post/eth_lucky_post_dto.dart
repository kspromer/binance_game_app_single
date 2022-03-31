class EthLuckyPostDto {
  int amount;
  String betType;
  int topOdds;

  EthLuckyPostDto({
      this.amount,
      this.betType,
      this.topOdds});

  EthLuckyPostDto.fromJson(dynamic json) {
    amount = json['amount'];
    betType = json['betType'];
    topOdds = json['topOdds'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['amount'] = amount;
    map['betType'] = betType;
    map['topOdds'] = topOdds;
    return map;
  }

}
