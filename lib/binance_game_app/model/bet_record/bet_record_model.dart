class BetRecordModel {
  int totalCount;
  int pageSize;
  int totalPage;
  int currPage;
  List<BetRecordModelList> list;

  BetRecordModel({
      this.totalCount, 
      this.pageSize, 
      this.totalPage, 
      this.currPage, 
      this.list});

  BetRecordModel.fromJson(dynamic json) {
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    totalPage = json['totalPage'];
    currPage = json['currPage'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list.add(BetRecordModelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['totalCount'] = totalCount;
    map['pageSize'] = pageSize;
    map['totalPage'] = totalPage;
    map['currPage'] = currPage;
    if (list != null) {
      map['list'] = list.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class BetRecordModelList {
  String issueNo;
  double close;
  String symbol;
  List<AppBetRecordListVOS> appBetRecordListVOS;

  BetRecordModelList({
      this.issueNo, 
      this.close,
      this.symbol,
      this.appBetRecordListVOS});

  BetRecordModelList.fromJson(dynamic json) {
    issueNo = json['issueNo'];
    close = json['close'];
    symbol = json['symbol'];
    if (json['appBetRecordListVOS'] != null) {
      appBetRecordListVOS = [];
      json['appBetRecordListVOS'].forEach((v) {
        appBetRecordListVOS.add(AppBetRecordListVOS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['issueNo'] = issueNo;
    map['close'] = close;
    map['symbol'] = symbol;
    if (appBetRecordListVOS != null) {
      map['appBetRecordListVOS'] = appBetRecordListVOS.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AppBetRecordListVOS {
  double money;
  String issueNo;
  int id;
  String point;
  double result;
  String symbol;

  AppBetRecordListVOS({
      this.money, 
      this.issueNo, 
      this.id, 
      this.point, 
      this.result, 
      this.symbol});

  AppBetRecordListVOS.fromJson(dynamic json) {
    money = json['money'];
    issueNo = json['issueNo'];
    id = json['id'];
    point = json['point'];
    result = json['result'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['money'] = money;
    map['issueNo'] = issueNo;
    map['id'] = id;
    map['point'] = point;
    map['result'] = result;
    map['symbol'] = symbol;
    return map;
  }

}