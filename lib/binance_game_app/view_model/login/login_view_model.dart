import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/dto/auth_code/auth_code_dto.dart';
import 'package:binance_game_app_single/binance_game_app/dto/login/login_dto.dart';
import 'package:binance_game_app_single/binance_game_app/dto/register/register_dto.dart';
import 'package:binance_game_app_single/binance_game_app/model/account/account_model.dart';
import 'package:binance_game_app_single/binance_game_app/utils/md5.dart';
import 'package:dio/dio.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

class LoginViewModel extends BaseViewModel {

  AccountModel model;

  String codeUrl = "${Constant.baseUrl}/app/register/captcha.jpg?uuid=${DateTime.now().millisecondsSinceEpoch}";

  void login(LoginDto loginDto,{Function success}) {
    debugPrint(loginDto.toJson().toString());
    loginDto.password = generateMd5(loginDto.passwordNo);
    this.post({},data: loginDto.toJson(),path: "/app/login/login",success: (data){
      debugPrint(data);
      success(data);
    });
  }

  void register(RegisterDto registerDto,{Function success}) {
    registerDto.uuid = codeUrl.split("uuid=")[1];
    registerDto.password = generateMd5(registerDto.passwordNo);
    debugPrint(registerDto.toJson().toString());
    this.post({},data: registerDto.toJson(),path: "/app/register/register",success: (data){
      debugPrint(data);
      success(data);
    });
  }

  void accountById({Function success}) {
    this.get({},path: "/auth/accountById",success: (data){
      model = AccountModel.fromJson(data);
    });
  }

  String getCodeUrl () {
    codeUrl = "${Constant.baseUrl}/app/register/captcha.jpg?uuid=${DateTime.now().millisecondsSinceEpoch}";
    super.notifyListeners();
  }

}