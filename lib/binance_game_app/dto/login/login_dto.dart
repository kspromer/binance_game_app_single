class LoginDto {
  String password;
  String passwordNo;
  String username;

  LoginDto({
      this.password, 
      this.passwordNo,
      this.username});

  LoginDto.fromJson(dynamic json) {
    password = json['password'];
    passwordNo = json['passwordNo'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['password'] = password;
    map['passwordNo'] = passwordNo;
    map['username'] = username;
    return map;
  }

}