class KlinesHistory {
  String issueNo;
  String symbol;
  String result;
  double close;

  KlinesHistory({
      this.issueNo, 
      this.symbol, 
      this.result,
      this.close});

  KlinesHistory.fromJson(dynamic json) {
    issueNo = json['issueNo'];
    symbol = json['symbol'];
    result = json['result'];
    close = json['close'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['issueNo'] = issueNo;
    map['symbol'] = symbol;
    map['result'] = result;
    map['close'] = close;
    return map;
  }

}