import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/model/base/ret_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/bet_record/bet_record_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_bet/btc_lucky_bet_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'interceptor/token_interceptor.dart';

class Http {

  /// 单例对象
  static Http _instance;
  final Dio dio;
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  Http._internal(this.dio);

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory Http.getInstance() => _getInstance();

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    if (_instance == null) {
      var options = BaseOptions(
        // baseUrl: '${Constant.baseUrl}',
        baseUrl: '${Constant.baseUrl}/',
        connectTimeout: 20000,
        receiveTimeout: 20000,
      );
      Dio dio = Dio(options);
      _instance = Http._internal(dio);
      _instance.dio.interceptors.add(new TokenInterceptor());
    }
    return _instance;
  }

  //get方法
  Future<RetModel> getPages(Map<String, dynamic> queryParameters,{String path = "",Options options}) async{
    try{
      Response response = await dio.get(path,queryParameters: queryParameters,options: options);
      debugPrint(response.data.toString());
      return RetModel.fromJson(response.data);
    } on DioError catch (e) {
      throw DioError(error: e.error);
    }
  }

  //get方法
  Future<RetModel> get(Map<String, dynamic> queryParameters,{String path = "",Options options}) async{
    try{
      Response response = await dio.get(path,queryParameters: queryParameters,options: options);
      print(response.data);
      RetModel retModel =  RetModel.fromJson(response.data);
      return retModel;
    } on DioError catch (e) {
      throw DioError(error: e.error);
    }
  }

  //post方法
  Future<RetModel> post(dynamic queryParameters,{Options options,String path = "",data}) async{
    try{
      Response response = await dio.post(path,queryParameters: queryParameters,data: data,options: options);
      print(response.data);
      RetModel retModel =  RetModel.fromJson(response.data);
      return retModel;
    } on DioError catch (e) {
      throw DioError(error: e.error);
    }
  }

  //post方法
  Future<RetModel> delete(dynamic data,{Options options,String path = "",}) async{
    try{
      Response response = await dio.delete(path,queryParameters: data,options: options);
      print(response.data);
      RetModel retModel =  RetModel.fromJson(response.data);
      return retModel;
    } on DioError catch (e) {
      throw DioError(error: e.error);
    }
  }

  //post方法
  Future<RetModel> postFormData(var formData,{Options options,String path = "",}) async{
    try{
      Response response = await dio.post(path,data: formData,options: options);
      print(response.data);
      RetModel retModel =  RetModel.fromJson(response.data);
      return retModel;
    }catch (err) {
      throw err;
    }
  }


}
