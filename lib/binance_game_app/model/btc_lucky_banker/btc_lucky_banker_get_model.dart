import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';

import 'btc_lucky_banker_bankerqueuemap_data_model.dart';
import 'btc_lucky_banker_currentbanker_data_model.dart';

class BtcLuckyBankerGetModel {
  CurrentBanker currentBanker;
  BankerQueueMap bankerQueueMap;

  BtcLuckyBankerGetModel({
      this.currentBanker,
      this.bankerQueueMap});

  BtcLuckyBankerGetModel.fromJson(dynamic json) {
    currentBanker = json['currentBanker'] != null ? CurrentBanker.fromJson(json['currentBanker']) : null;
    bankerQueueMap = json['bankerQueueMap'] != null ? BankerQueueMap.fromJson(json['bankerQueueMap']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (currentBanker != null) {
      map['currentBanker'] = currentBanker.toJson();
    }
    if (bankerQueueMap != null) {
      map['bankerQueueMap'] = bankerQueueMap.toJson();
    }
    return map;
  }

}

class BankerQueueMap {
  List<BtcLuckyBankerBankerqueuemapDataModel> nn;
  List<BtcLuckyBankerBankerqueuemapDataModel> sn;

  BankerQueueMap({
      this.nn,
      this.sn});

  BankerQueueMap.fromJson(dynamic json) {
    if (json['NN'] != null) {
      nn = [];
      json['NN'].forEach((v) {
        nn.add(BtcLuckyBankerBankerqueuemapDataModel.fromJson(v));
      });
    }
    if (json['SN'] != null) {
      sn = [];
      json['SN'].forEach((v) {
        sn.add(BtcLuckyBankerBankerqueuemapDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (nn != null) {
      map['NN'] = nn.map((v) => v.toJson()).toList();
    }
    if (sn != null) {
      map['SN'] = sn.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CurrentBanker {
  BtcLuckyBankerCurrentbankerDataModel nn;
  BtcLuckyBankerCurrentbankerDataModel sn;

  CurrentBanker({
      this.nn,
      this.sn});

  CurrentBanker.fromJson(dynamic json) {
    nn = json['NN'] != null ? BtcLuckyBankerCurrentbankerDataModel.fromJson(json['NN']) : null;
    sn = json['SN'] != null ? BtcLuckyBankerCurrentbankerDataModel.fromJson(json['SN']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (nn != null) {
      map['NN'] = nn.toJson();
    }
    if (sn != null) {
      map['SN'] = sn.toJson();
    }
    return map;
  }

}
