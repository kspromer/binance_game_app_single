import 'btc_lucky_bet_data_bet_itemvos_model.dart';
import 'btc_lucky_bet_data_bets_model.dart';
import 'btc_lucky_bet_data_results_model.dart';

class BtcLuckyBetDataModel {
  String issueNo;
  String betNo;
  int money;
  String bankerType;
  BtcLuckyBetDataBetsModel bets;
  BtcLuckyBetDataResultsModel results;
  List<BtcLuckyBetDataBetItemvosModel> betItemVOS;

  BtcLuckyBetDataModel({
    this.issueNo,
    this.betNo,
    this.bets,
    this.money,
    this.bankerType,
    this.results,
    this.betItemVOS});

  BtcLuckyBetDataModel.fromJson(dynamic json) {
    issueNo = json['issueNo'];
    betNo = json['betNo'];
    money = json['money'];
    bankerType = json['bankerType'];
    bets = json['bets'] != null ? BtcLuckyBetDataBetsModel.fromJson(json['bets']) : null;
    results = json['results'] != null ? BtcLuckyBetDataResultsModel.fromJson(json['results']) : null;
    if (json['betItemVOS'] != null) {
      betItemVOS = [];
      json['betItemVOS'].forEach((v) {
        print(v);
        betItemVOS.add(BtcLuckyBetDataBetItemvosModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['issueNo'] = issueNo;
    map['betNo'] = betNo;
    map['money'] = money;
    map['bankerType'] = bankerType;
    if (bets != null) {
      map['bets'] = bets.toJson();
    }
    if (results != null) {
      map['results'] = results.toJson();
    }
    if (betItemVOS != null) {
      map['betItemVOS'] = betItemVOS.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
