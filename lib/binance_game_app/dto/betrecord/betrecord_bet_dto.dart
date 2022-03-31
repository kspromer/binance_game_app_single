class BetrecordBetDto {
  double money;
  String point;

  BetrecordBetDto({
      this.money, 
      this.point});

  BetrecordBetDto.fromJson(dynamic json) {
    money = json['money'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['money'] = money;
    map['point'] = point;
    return map;
  }

}