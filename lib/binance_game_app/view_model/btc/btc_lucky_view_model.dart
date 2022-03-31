// import 'dart:convert';
//
// import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
// import 'package:binance_game_app_single/binance_game_app/dto/btc_lucky_banker_delete/btc_lucky_banker_delete_dto.dart';
// import 'package:binance_game_app_single/binance_game_app/dto/btc_lucky_banker_post/btc_lucky_banker_post_dto.dart';
// import 'package:binance_game_app_single/binance_game_app/dto/btc_lucky_post/btc_lucky_post_dto.dart';
// import 'package:binance_game_app_single/binance_game_app/dto/page/base_page_dto.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_banker/btc_lucky_banker_get_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_bet/btc_lucky_bet_data_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_bet/btc_lucky_bet_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_bettype/btc_lucky_bettype_get_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_current_issue_data/btc_lucky_current_issue_data_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_history/btc_lucky_history_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/minute_10_value/minute_10_value_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
// import 'package:flutter/widgets.dart';
//
// class BtcLuckyViewModel extends BaseViewModel {
//
//
//   BtcLuckyBankerGetModel btcLuckyBankerGetModel;
//
//   BtcLuckyCurrentIssueDataModel btcLuckyCurrentIssueDataModel;
//
//   List<BtcLuckyBettypeGetModel> btcLuckyBettypeGetModels;
//
//   List<BtcLuckyBetDataModel> btcLuckyBetDataModels;
//
//   List<Minute10ValueModel> minute10ValueModel;
//
//   BasePageDto basePageDto = BasePageDto(pageIndex: 0,pageSize: 10);
//
//   ScrollController scrollController = ScrollController();
//
//
//   BtcLuckyViewModel(){
//     scrollController.addListener(_scrollListener);
//   }
//
//   void btcLuckyCurrentIssueData({Function success}) {
//     this.get({},path: "/btc/lucky/currentIssueData",success: (data) {
//       btcLuckyCurrentIssueDataModel = BtcLuckyCurrentIssueDataModel.fromJson(data);
//       print("currentIssueData = ${btcLuckyCurrentIssueDataModel.toJson().toString()}");
//     });
//   }
//
//   void btcLuckyBanker({Function success}){
//     this.get({},path: "/btc/lucky/banker",success: (data){
//       btcLuckyBankerGetModel = BtcLuckyBankerGetModel.fromJson(data);
//       print(btcLuckyBankerGetModel.toJson());
//       if(success != null) {
//         success(data);
//       }
//     });
//   }
//
//
//   void btcLuckyHistory({Function success}){
//     this.get({"pointSource": "btc"},path: "/btc/lucky/history",success: (data){
//       print("btcLuckyHistory = ${data}");
//       if (data != null) {
//         minute10ValueModel = [];
//         data.forEach((v) {
//           if(v != null) {
//             Minute10ValueModel model = Minute10ValueModel(niu: "无牛");
//             v.forEach((vData) {
//               BtcLuckyHistoryModel btcLuckyHistoryModel = BtcLuckyHistoryModel.fromJson(vData);
//               if("BET_1" == btcLuckyHistoryModel.betType) model.bet1 = btcLuckyHistoryModel.valid;
//               else if("BET_2" == btcLuckyHistoryModel.betType) model.bet2 = btcLuckyHistoryModel.valid;
//               else if(btcLuckyHistoryModel.valid) model.niu = Constant.enumTypeToStr[btcLuckyHistoryModel.betType];
//             });
//             minute10ValueModel.add(model);
//           }
//         });
//       }
//     });
//   }
//
//   void btcLuckyBet({Function success}){
//     if(super.loading || basePageDto.totalPages == basePageDto.pageIndex) {
//       return;
//     }
//     basePageDto.pageIndex+=1;
//     this.getPages(basePageDto.toJson(),path: "/btc/lucky/bet",success: (value){
//       if(btcLuckyBetDataModels == null || basePageDto.pageIndex == 1) {
//         btcLuckyBetDataModels = value.data;
//       }else {
//         btcLuckyBetDataModels.addAll(value.data);
//       }
//       basePageDto.totalPages = value.totalPages;
//     });
//   }
//
//
//
//   void btcLuckyBankerPost(BtcLuckyBankerPostDto dto,{Function success}){
//     this.post(dto.toJson(),path: "/btc/lucky/banker",success: (data){
//       if(success != null) {
//         success(data);
//       }
//     });
//   }
//
//   void btcLuckyBankerDelete(BtcLuckyBankerDeleteDto dto,{Function success}){
//     this.delete(dto.toJson(),path: "/btc/lucky/banker",success: (data){
//       if(success != null) {
//         success(data);
//       }
//     });
//   }
//
//   void btcLuckyBetType({Function success}) {
//     this.get({},path: "/btc/lucky/betType",success: (data){
//       if (data != null) {
//         btcLuckyBettypeGetModels = [];
//         data.forEach((v) {
//           btcLuckyBettypeGetModels.add(BtcLuckyBettypeGetModel.fromJson(v));
//         });
//         print(data);
//       }
//     });
//   }
//
//
//   void btcLuckyPost(List<BtcLuckyPostDto> dtos,{Function success}){
//     debugPrint(jsonEncode(dtos));
//     this.post({},data: jsonEncode(dtos),path: "/btc/lucky",success: (data){
//       if(success != null) {
//         success(data);
//       }
//     });
//   }
//
//   void _scrollListener() {
//     if (scrollController.position.extentAfter < 1) {
//       this.btcLuckyBet();
//     }
//   }
//
//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }
//
// }
