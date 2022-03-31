class AuthCodeDto {
  String phone;
  String code;

  AuthCodeDto({
      this.phone, 
      this.code});

  AuthCodeDto.fromJson(dynamic json) {
    phone = json['phone'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['phone'] = phone;
    map['code'] = code;
    return map;
  }

}