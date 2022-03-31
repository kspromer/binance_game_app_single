class BtcLuckyBankerCurrentbankerDataModel {
  int userId;
  int money;
  int result;
  String type;

  BtcLuckyBankerCurrentbankerDataModel({
      this.userId, 
      this.money, 
      this.result, 
      this.type});

  BtcLuckyBankerCurrentbankerDataModel.fromJson(dynamic json) {
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