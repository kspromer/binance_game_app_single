import 'btc_lucky_banker_bankerqueuemap_bets_data_model.dart';

class BtcLuckyBankerBankerqueuemapDataModel {
  int id;
  List<BtcLuckyBankerBankerqueuemapBetsDataModel> bets;
  int money;
  int bonus;
  int tax;

  BtcLuckyBankerBankerqueuemapDataModel({
    this.id,
    this.bets,
    this.money,
    this.bonus,
    this.tax});

  BtcLuckyBankerBankerqueuemapDataModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['bets'] != null) {
      bets = [];
      json['bets'].forEach((v) {
        bets.add(BtcLuckyBankerBankerqueuemapBetsDataModel.fromJson(v));
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
