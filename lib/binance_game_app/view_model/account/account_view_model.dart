import 'package:binance_game_app_single/binance_game_app/dto/auth_code/auth_code_dto.dart';
import 'package:binance_game_app_single/binance_game_app/model/account/account_model.dart';
import 'package:dio/dio.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

class AccountViewModel extends BaseViewModel {

  AccountModel model;

  void info({Function success}) {
    debugPrint('info');
    this.get({},path: "/app/binancegame/account/info",success: (data){
      model = AccountModel.fromJson(data);
    });
  }

}