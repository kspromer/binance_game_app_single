import 'package:binance_game_app_single/binance_game_app/model/ws/message.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/ws/ws_view_model.dart';

abstract class MessageHandler<T extends Message>{


  // void execute(Channel channel, T message);
  void execute(WsViewModel wsViewModel,dynamic message);

  String getType();
}
