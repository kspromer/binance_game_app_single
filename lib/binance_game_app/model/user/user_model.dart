class UserModel {
  int id;
  int money;
  dynamic upper;

  UserModel({
      this.id, 
      this.money, 
      this.upper});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    money = json['money'];
    upper = json['upper'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['money'] = money;
    map['upper'] = upper;
    return map;
  }

}