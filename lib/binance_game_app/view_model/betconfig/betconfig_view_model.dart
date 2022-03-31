import 'package:binance_game_app_single/binance_game_app/dto/auth_code/auth_code_dto.dart';
import 'package:binance_game_app_single/binance_game_app/model/account/account_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/betconfig/betconfig_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/klines/klines_history.dart';
import 'package:dio/dio.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

class BetconfigViewModel extends BaseViewModel {

  List<BetconfigModel> betconfigList = [];

  void list({Function success}) {
    debugPrint('history');
    this.get({},path: "/app/binancegame/betconfig/list",success: (data){
      if (data != null) {
        betconfigList = [];
        data.forEach((v) {
          betconfigList.add(BetconfigModel.fromJson(v));
        });
      }
    });
  }

}