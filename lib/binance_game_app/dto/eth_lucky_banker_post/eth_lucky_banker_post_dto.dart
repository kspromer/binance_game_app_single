class EthLuckyBankerPostDto {
  String bankerType;
  String money;
  String playerId;

  EthLuckyBankerPostDto({
      this.bankerType,
      this.money,
      this.playerId});

  EthLuckyBankerPostDto.fromJson(dynamic json) {
    bankerType = json['bankerType'];
    money = json['money'];
    playerId = json['playerId'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['bankerType'] = bankerType;
    map['money'] = money;
    map['playerId'] = playerId;
    return map;
  }

}
