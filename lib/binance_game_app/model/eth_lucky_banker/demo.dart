class Demo {
  int id;
  List<Bets> bets;
  int money;
  int bonus;
  int tax;

  Demo({
      this.id, 
      this.bets, 
      this.money, 
      this.bonus, 
      this.tax});

  Demo.fromJson(dynamic json) {
    id = json['id'];
    if (json['bets'] != null) {
      bets = [];
      json['bets'].forEach((v) {
        bets.add(Bets.fromJson(v));
      });
    }
    money = json['money'];
    bonus = json['bonus'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    if (bets != null) {
      map['bets'] = bets.map((v) => v.toJson()).toList();
    }
    map['money'] = money;
    map['bonus'] = bonus;
    map['tax'] = tax;
    return map;
  }

}

class Bets {
  int money;
  String betType;
  String betNO;
  String result;

  Bets({
      this.money, 
      this.betType, 
      this.betNO, 
      this.result});

  Bets.fromJson(dynamic json) {
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