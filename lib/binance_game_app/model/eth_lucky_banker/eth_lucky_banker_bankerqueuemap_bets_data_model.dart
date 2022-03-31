class EthLuckyBankerBankerqueuemapBetsDataModel {
  int money;
  String betType;
  String betNO;
  String result;

  EthLuckyBankerBankerqueuemapBetsDataModel({
    this.money,
    this.betType,
    this.betNO,
    this.result});

  EthLuckyBankerBankerqueuemapBetsDataModel.fromJson(dynamic json) {
    money = json['money'];
    betType = json['betType'];
    betNO = json['betNO'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['money'] = money;
    map['betType'] = betType;
    map['betNO'] = betNO;
    map['result'] = result;
    return map;
  }

}
