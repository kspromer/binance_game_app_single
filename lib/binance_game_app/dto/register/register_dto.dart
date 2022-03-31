class RegisterDto {
  String code;
  String inviteCode;
  String password;
  String passwordNo;
  String username;
  String uuid;

  RegisterDto({
      this.code, 
      this.inviteCode, 
      this.password, 
      this.passwordNo,
      this.username,
      this.uuid});

  RegisterDto.fromJson(dynamic json) {
    code = json['code'];
    inviteCode = json['inviteCode'];
    password = json['password'];
    passwordNo = json['passwordNo'];
    username = json['username'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = code;
    map['inviteCode'] = inviteCode;
    map['password'] = password;
    map['passwordNo'] = passwordNo;
    map['username'] = username;
    map['uuid'] = uuid;
    return map;
  }

}