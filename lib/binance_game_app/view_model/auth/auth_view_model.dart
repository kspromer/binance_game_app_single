import 'package:binance_game_app_single/binance_game_app/dto/auth_code/auth_code_dto.dart';
import 'package:binance_game_app_single/binance_game_app/model/account/account_model.dart';
import 'package:dio/dio.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

class AuthViewModel extends BaseViewModel {

  AccountModel model;

  void authCode(AuthCodeDto authCodeDto,{Function success}) {
    debugPrint(authCodeDto.toJson().toString());
    this.get(authCodeDto.toJson(),path: "/auth/code",success: (data){
      success(data);
    });
  }

  void accountById({Function success}) {
    this.get({},path: "/auth/accountById",success: (data){
      model = AccountModel.fromJson(data);
      // success(data);
    });
  }
}