class EthLuckyBankerDeleteDto {
  String bankerType;
  String playerId;

  EthLuckyBankerDeleteDto({
      this.bankerType,
      this.playerId});

  EthLuckyBankerDeleteDto.fromJson(dynamic json) {
    bankerType = json['bankerType'];
    playerId = json['playerId'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['bankerType'] = bankerType;
    map['playerId'] = playerId;
    return map;
  }

}
