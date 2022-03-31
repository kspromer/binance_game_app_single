
import 'eth_lucky_bet_data_bet_itemvos_model.dart';
import 'eth_lucky_bet_data_bets_model.dart';
import 'eth_lucky_bet_data_results_model.dart';

class EthLuckyBetDataModel {
  String issueNo;
  String betNo;
  int money;
  String bankerType;
  EthLuckyBetDataBetsModel bets;
  EthLuckyBetDataResultsModel results;
  List<EthLuckyBetDataBetItemvosModel> betItemVOS;

  EthLuckyBetDataModel({
    this.issueNo,
    this.betNo,
    this.bets,
    this.money,
    this.bankerType,
    this.results,
    this.betItemVOS});

  EthLuckyBetDataModel.fromJson(dynamic json) {
    issueNo = json['issueNo'];
    betNo = json['betNo'];
    money = json['money'];
    bankerType = json['bankerType'];
    bets = json['bets'] != null ? EthLuckyBetDataBetsModel.fromJson(json['bets']) : null;
    results = json['results'] != null ? EthLuckyBetDataResultsModel.fromJson(json['results']) : null;
    if (json['betItemVOS'] != null) {
      betItemVOS = [];
      json['betItemVOS'].forEach((v) {
        print(v);
        betItemVOS.add(EthLuckyBetDataBetItemvosModel.fromJson(v));
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
