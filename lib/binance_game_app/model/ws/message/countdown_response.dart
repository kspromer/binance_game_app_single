import 'package:binance_game_app_single/binance_game_app/model/ws/message.dart';

class CountdownResponse extends Message{

  static final String TYPE = "COUNTDOWN_RESPONSE";

  int countDown;

  CountdownResponse({
      this.countDown});

  CountdownResponse.fromJson(dynamic json) {
    countDown = json['countDown'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['countDown'] = countDown;
    return map;
  }

}
