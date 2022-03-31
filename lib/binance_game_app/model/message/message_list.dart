class Message {
  int totalCount;
  int pageSize;
  int totalPage;
  int currPage;
  List<MessageList> list;

  Message({
      this.totalCount, 
      this.pageSize, 
      this.totalPage, 
      this.currPage, 
      this.list});

  Message.fromJson(dynamic json) {
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    totalPage = json['totalPage'];
    currPage = json['currPage'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list.add(MessageList.fromJson(v));
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

class MessageList {
  int id;
  int accountId;
  String title;
  String detail;
  dynamic type;
  dynamic typeStr;
  String createTime;

  MessageList({
      this.id, 
      this.accountId, 
      this.title, 
      this.detail, 
      this.type, 
      this.typeStr, 
      this.createTime});

  MessageList.fromJson(dynamic json) {
    id = json['id'];
    accountId = json['accountId'];
    title = json['title'];
    detail = json['detail'];
    type = json['type'];
    typeStr = json['typeStr'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['accountId'] = accountId;
    map['title'] = title;
    map['detail'] = detail;
    map['type'] = type;
    map['typeStr'] = typeStr;
    map['createTime'] = createTime;
    return map;
  }

}