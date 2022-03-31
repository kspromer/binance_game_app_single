import 'package:binance_game_app_single/binance_game_app/model/base/ret_model.dart';
import 'package:binance_game_app_single/binance_game_app/utils/http.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BaseViewModel extends ChangeNotifier {

  bool loading = false;

  /// 开启加载
  void openLoading() {
    this.loading = true;
    debugPrint("openLoading");
    EasyLoading.show(status: 'loading...');
    this.notifyListeners();
  }

  /// 关闭加载
  void closeLoading() {
    this.loading = false;
    debugPrint("closeLoading");
    EasyLoading.dismiss();
    this.notifyListeners();
  }

  //通知
  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  void getPages(Map<String, dynamic> queryParameters,{String path = "",Options options,Function success}) {
    this.openLoading();
    Http.getInstance().getPages(queryParameters,path: path,options: options).then((value){
      success(value);
    }).catchError((err) {
      print(err);
      EasyLoading.showToast(err.error);
    }).whenComplete((){
      this.closeLoading();
    });
  }


  void get(Map<String, dynamic> queryParameters,{String path = "",Options options,Function success}) {
    this.openLoading();
    Http.getInstance().get(queryParameters,path: path,options: options).then((value){
      success(value.data);
    }).catchError((err) {
      print(err);
      EasyLoading.showToast(err.error);
    }).whenComplete((){
      this.closeLoading();
    });
  }


  void post(Map<String, dynamic> queryParameters,{String path = "",data,Options options,Function success}) {
    this.openLoading();
    Http.getInstance().post(queryParameters,data: data,path: path,options: options).then((value){
      success(value.data);
    }).catchError((err) {
      print(err);
      EasyLoading.showToast(err.error);
    }).whenComplete((){
      this.closeLoading();
    });
  }

  void delete(Map<String, dynamic> queryParameters,{String path = "",Options options,Function success}) {
    this.openLoading();
    Http.getInstance().delete(queryParameters,path: path,options: options).then((value){
      success(value.data);
    }).catchError((err) {
      print(err);
      EasyLoading.showToast(err.error);
    }).whenComplete((){
      this.closeLoading();
    });
  }



  //销毁
  @override
  void dispose() {
    debugPrint("BaseViewModel dispose ...");
    super.dispose();
  }

}
