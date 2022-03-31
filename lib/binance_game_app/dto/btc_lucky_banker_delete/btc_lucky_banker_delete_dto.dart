class BtcLuckyBankerDeleteDto {
  String bankerType;
  String playerId;

  BtcLuckyBankerDeleteDto({
      this.bankerType,
      this.playerId});

  BtcLuckyBankerDeleteDto.fromJson(dynamic json) {
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
