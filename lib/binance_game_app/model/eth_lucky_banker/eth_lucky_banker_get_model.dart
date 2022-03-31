

import 'eth_lucky_banker_bankerqueuemap_data_model.dart';
import 'eth_lucky_banker_currentbanker_data_model.dart';

class EthLuckyBankerGetModel {
  CurrentBanker currentBanker;
  BankerQueueMap bankerQueueMap;

  EthLuckyBankerGetModel({
      this.currentBanker,
      this.bankerQueueMap});

  EthLuckyBankerGetModel.fromJson(dynamic json) {
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
  List<EthLuckyBankerBankerqueuemapDataModel> nn;
  List<EthLuckyBankerBankerqueuemapDataModel> dui;

  BankerQueueMap({
      this.nn,
      this.dui});

  BankerQueueMap.fromJson(dynamic json) {
    if (json['NN'] != null) {
      nn = [];
      json['NN'].forEach((v) {
        nn.add(EthLuckyBankerBankerqueuemapDataModel.fromJson(v));
      });
    }
    if (json['DUI'] != null) {
      dui = [];
      json['DUI'].forEach((v) {
        dui.add(EthLuckyBankerBankerqueuemapDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (nn != null) {
      map['NN'] = nn.map((v) => v.toJson()).toList();
    }
    if (dui != null) {
      map['DUI'] = dui.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CurrentBanker {
  EthLuckyBankerCurrentbankerDataModel nn;
  EthLuckyBankerCurrentbankerDataModel dui;

  CurrentBanker({
      this.nn,
      this.dui});

  CurrentBanker.fromJson(dynamic json) {
    nn = json['NN'] != null ? EthLuckyBankerCurrentbankerDataModel.fromJson(json['NN']) : null;
    dui = json['DUI'] != null ? EthLuckyBankerCurrentbankerDataModel.fromJson(json['DUI']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (nn != null) {
      map['NN'] = nn.toJson();
    }
    if (dui != null) {
      map['DUI'] = dui.toJson();
    }
    return map;
  }

}
