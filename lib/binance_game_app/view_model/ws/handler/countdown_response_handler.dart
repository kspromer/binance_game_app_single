
import 'dart:async';

import 'package:binance_game_app_single/binance_game_app/handler/message_handler.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/invocation_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/message/countdown_request.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/message/countdown_response.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

import '../ws_view_model.dart';

class CountdownResponseHandler extends BaseViewModel implements MessageHandler{


  StreamController streamController = StreamController<int>.broadcast();

  int lotteryType;

  CountdownResponse countdownResponse;

  WsViewModel wsViewModel;

  @override
  void execute(WsViewModel wsViewModel,message) {
    if(this.wsViewModel == null) {
      this.wsViewModel = wsViewModel;
    }


    countdownResponse = CountdownResponse.fromJson(message);
    debugPrint(countdownResponse.countDown.toString());
    this.stream(countdownResponse.countDown);
  }

  void stream(int countDown) {
    if(countDown < 1){
      InvocationModel invocationModel = InvocationModel()..type = CountdownRequest.TYPE;
      this.wsViewModel.sendMessage(invocationModel.toJson().toString());
      return;
    }
    streamController.sink.add(countDown--);
    //更新投注状态
    if(1 != lotteryType && countDown <= 60 && countDown >= 56) {
      lotteryType = 1;
      this.notifyListeners();
    }else if(2 != lotteryType && countDown <= 55 && countDown >= 11){
      lotteryType = 2;
      this.notifyListeners();
    }else if(3 != lotteryType && countDown <= 10 && countDown >= 1){
      lotteryType = 3;
      this.notifyListeners();
    }
    Future.delayed(Duration(seconds: 1),(){
      this.stream(countDown);
    });
  }

  @override
  String getType() {
    return CountdownResponse.TYPE;
  }


  @override
  void dispose() {
    super.dispose();
    streamController.close();
  }

}
