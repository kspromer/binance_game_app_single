class EthLuckyBankerCurrentbankerDataModel {
  int userId;
  int money;
  int result;
  String type;

  EthLuckyBankerCurrentbankerDataModel({
      this.userId,
      this.money,
      this.result,
      this.type});

  EthLuckyBankerCurrentbankerDataModel.fromJson(dynamic json) {
    userId = json['userId'];
    money = json['money'];
    result = json['result'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['userId'] = userId;
    map['money'] = money;
    map['result'] = result;
    map['type'] = type;
    return map;
  }

}
