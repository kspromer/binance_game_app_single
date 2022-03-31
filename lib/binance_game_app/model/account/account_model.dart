class AccountModel {
  dynamic device;
  String createTime;
  String lastLoginTime;
  String username;
  dynamic phone;
  String roleName;
  dynamic inviteCode;
  dynamic upper;
  double money;

  AccountModel({
      this.device, 
      this.createTime, 
      this.lastLoginTime, 
      this.username, 
      this.phone, 
      this.roleName, 
      this.inviteCode, 
      this.upper, 
      this.money});

  AccountModel.fromJson(dynamic json) {
    device = json['device'];
    createTime = json['createTime'];
    lastLoginTime = json['lastLoginTime'];
    username = json['username'];
    phone = json['phone'];
    roleName = json['roleName'];
    inviteCode = json['inviteCode'];
    upper = json['upper'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['device'] = device;
    map['createTime'] = createTime;
    map['lastLoginTime'] = lastLoginTime;
    map['username'] = username;
    map['phone'] = phone;
    map['roleName'] = roleName;
    map['inviteCode'] = inviteCode;
    map['upper'] = upper;
    map['money'] = money;
    return map;
  }

}