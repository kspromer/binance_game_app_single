
import 'package:binance_game_app_single/binance_game_app/handler/message_handler.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/message.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/message/heartbeat_request.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

import '../ws_view_model.dart';

class HeartbeatResponseHandler extends BaseViewModel implements MessageHandler{


  @override
  void execute(WsViewModel wsViewModel,dynamic message) {
    debugPrint(message.toString());
  }

  @override
  String getType() {
    return HeartbeatResponse.TYPE;
  }

}
