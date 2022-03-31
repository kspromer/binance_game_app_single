class KlinesCurrentissueno {
  String issueNo;
  String symbol;
  dynamic close;
  int state;
  String result;
  int openTime;
  int closeTime;
  int countdown;
  dynamic id;

  KlinesCurrentissueno({
      this.issueNo, 
      this.symbol, 
      this.close, 
      this.state, 
      this.result, 
      this.openTime, 
      this.closeTime, 
      this.countdown, 
      this.id});

  KlinesCurrentissueno.fromJson(dynamic json) {
    issueNo = json['issueNo'];
    symbol = json['symbol'];
    close = json['close'];
    state = json['state'];
    result = json['result'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    countdown = json['countdown'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['issueNo'] = issueNo;
    map['symbol'] = symbol;
    map['close'] = close;
    map['state'] = state;
    map['result'] = result;
    map['openTime'] = openTime;
    map['closeTime'] = closeTime;
    map['countdown'] = countdown;
    map['id'] = id;
    return map;
  }

}