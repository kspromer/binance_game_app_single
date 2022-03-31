import 'package:binance_game_app_single/binance_game_app/model/ws/message.dart';

class HeartbeatResponse extends Message {

  static final String TYPE = "HEARTBEAT_RESPONSE";

  @override
  Map<String, dynamic> toJson() {
    return null;
  }

}
