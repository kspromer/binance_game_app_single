class BtcLuckyCurrentIssueDataModel {
  double hign;
  double low;
  double close;
  String hignPoint;
  String lowPoint;
  String closePoint;
  String currentIssueNo;

  BtcLuckyCurrentIssueDataModel({
      this.hign, 
      this.low, 
      this.close, 
      this.hignPoint, 
      this.lowPoint, 
      this.closePoint, 
      this.currentIssueNo});

  BtcLuckyCurrentIssueDataModel.fromJson(dynamic json) {
    hign = json['hign'];
    low = json['low'];
    close = json['close'];
    hignPoint = json['hignPoint'];
    lowPoint = json['lowPoint'];
    closePoint = json['closePoint'];
    currentIssueNo = json['currentIssueNo'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['hign'] = hign;
    map['low'] = low;
    map['close'] = close;
    map['hignPoint'] = hignPoint;
    map['lowPoint'] = lowPoint;
    map['closePoint'] = closePoint;
    map['currentIssueNo'] = currentIssueNo;
    return map;
  }

}