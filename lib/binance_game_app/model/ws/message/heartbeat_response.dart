import 'package:binance_game_app_single/binance_game_app/model/ws/message.dart';

class HeartbeatRequest implements Message {

  static final String TYPE = "HEARTBEAT_REQUEST";

  @override
  Map<String, dynamic> toJson() {
    return null;
  }

}
