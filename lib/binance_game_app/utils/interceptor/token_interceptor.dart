import 'dart:io';

import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/model/base/ret_model.dart';
import 'package:binance_game_app_single/binance_game_app/pages/login/login_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../cache_util.dart';


class TokenInterceptor extends Interceptor {


  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await CacheUtil.getData<String>(Constant.AUTHORIZATION);
    print("${options.uri}");
    print("${token}");
    if(token != null) {
      Map<String, dynamic> headers = {
        "${Constant.AUTHORIZATION}": token
      };
      options.headers = headers;
    }
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    //如果服务器挂掉了
    if (err.error.runtimeType == SocketException) {
      EasyLoading.showToast("您的设备没有联网,请检查您的设备网络");
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //如果请求成功判断状态码
    RetModel retModel =  RetModel.fromJson(response.data);
    if (response.statusCode == 200) {
      if(retModel.code == 0) {
        handler.next(response);
        return;
      }else {

        handler.reject(DioError(error: retModel.msg),true);
        // throw DioError(error: retModel.errMessage);
      }
      //表示服务器开小差了
    }else {
      handler.reject(DioError(error: retModel.msg));
    }
  }
}