import 'dart:convert';

import 'package:binance_game_app_single/binance_game_app/model/ws/message.dart';

class InvocationModel<T extends Message> {
  String type;
  dynamic message;

  InvocationModel({
      this.type,
      this.message});

  InvocationModel.fromJson(dynamic json) {
    type = json['type'];
    message = json['message'] != null ? jsonDecode(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['type'] = type;
    if (message != null) {
      map['message'] = message.toJson();
    }
    return map;
  }

}
