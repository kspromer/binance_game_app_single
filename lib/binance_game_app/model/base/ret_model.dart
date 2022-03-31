class RetModel {
  String msg;
  int code;
  dynamic data;

  RetModel({
      this.msg, 
      this.code, 
      this.data});

  RetModel.fromJson(dynamic json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['msg'] = msg;
    map['code'] = code;
    map['data'] = data;
    return map;
  }

}