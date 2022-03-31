import 'btc_lucky_bet_data_model.dart';

class BtcLuckyBetModel {
  bool success;
  dynamic errCode;
  dynamic errMessage;
  int totalCount;
  int pageSize;
  int pageIndex;
  List<BtcLuckyBetDataModel> data;
  bool empty;
  bool notEmpty;
  int totalPages;

  BtcLuckyBetModel({
      this.success,
      this.errCode,
      this.errMessage,
      this.totalCount,
      this.pageSize,
      this.pageIndex,
      this.data,
      this.empty,
      this.notEmpty,
      this.totalPages});

  BtcLuckyBetModel.fromJson(dynamic json) {
    success = json['success'];
    errCode = json['errCode'];
    errMessage = json['errMessage'];
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    pageIndex = json['pageIndex'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        print(v);
        data.add(BtcLuckyBetDataModel.fromJson(v));
      });
    }
    empty = json['empty'];
    notEmpty = json['notEmpty'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['success'] = success;
    map['errCode'] = errCode;
    map['errMessage'] = errMessage;
    map['totalCount'] = totalCount;
    map['pageSize'] = pageSize;
    map['pageIndex'] = pageIndex;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    map['empty'] = empty;
    map['notEmpty'] = notEmpty;
    map['totalPages'] = totalPages;
    return map;
  }

}


