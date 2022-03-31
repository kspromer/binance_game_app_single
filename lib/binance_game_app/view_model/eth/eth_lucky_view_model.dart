//
//
// import 'dart:convert';
//
// import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
// import 'package:binance_game_app_single/binance_game_app/dto/eth_lucky_banker_delete/eth_lucky_banker_delete_dto.dart';
// import 'package:binance_game_app_single/binance_game_app/dto/eth_lucky_banker_post/eth_lucky_banker_post_dto.dart';
// import 'package:binance_game_app_single/binance_game_app/dto/eth_lucky_post/eth_lucky_post_dto.dart';
// import 'package:binance_game_app_single/binance_game_app/dto/page/base_page_dto.dart';
// import 'package:binance_game_app_single/binance_game_app/model/eth_lucky_banker/eth_lucky_banker_get_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/eth_lucky_bet/eth_lucky_bet_data_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/eth_lucky_bettype/eth_lucky_bettype_get_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/eth_lucky_current_issue_data/eth_lucky_current_issue_data_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/eth_lucky_history/eth_lucky_history_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/minute_10_value/minute_10_value_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
// import 'package:flutter/cupertino.dart';
//
// class EthLuckyViewModel extends BaseViewModel {
//
//
//   EthLuckyBankerGetModel ethLuckyBankerGetModel;
//
//   EthLuckyCurrentIssueDataModel ethLuckyCurrentIssueDataModel;
//
//   List<EthLuckyBettypeGetModel> ethLuckyBettypeGetModels;
//
//   List<EthLuckyBetDataModel> ethLuckyBetDataModels;
//
//   List<Minute10ValueModel> minute10ValueModel;
//
//   BasePageDto basePageDto = BasePageDto(pageIndex: 0,pageSize: 10);
//
//   ScrollController scrollController = ScrollController();
//
//
//   EthLuckyViewModel(){
//     scrollController.addListener(_scrollListener);
//   }
//
//   void ethLuckyCurrentIssueData({Function success}) {
//     this.get({},path: "/eth/lucky/currentIssueData",success: (data) {
//       ethLuckyCurrentIssueDataModel = EthLuckyCurrentIssueDataModel.fromJson(data);
//       print("currentIssueData = ${ethLuckyCurrentIssueDataModel.toJson().toString()}");
//     });
//   }
//
//   void ethLuckyBanker({Function success}){
//     this.get({},path: "/eth/lucky/banker",success: (data){
//       ethLuckyBankerGetModel = EthLuckyBankerGetModel.fromJson(data);
//       print(ethLuckyBankerGetModel.toJson());
//       if(success != null) {
//         success(data);
//       }
//     });
//   }
//
//
//   void ethLuckyHistory({Function success}){
//     this.get({"pointSource": "eth"},path: "/eth/lucky/history",success: (data){
//       print("ethLuckyHistory = ${data}");
//       if (data != null) {
//         minute10ValueModel = [];
//         data.forEach((v) {
//           if(v != null) {
//             Minute10ValueModel model = Minute10ValueModel(niu: "无牛");
//             v.forEach((vData) {
//               EthLuckyHistoryModel ethLuckyHistoryModel = EthLuckyHistoryModel.fromJson(vData);
//               if("BET_1" == ethLuckyHistoryModel.betType) model.bet1 = ethLuckyHistoryModel.valid;
//               else if("BET_2" == ethLuckyHistoryModel.betType) model.bet2 = ethLuckyHistoryModel.valid;
//               else if(ethLuckyHistoryModel.valid) model.niu = Constant.enumTypeToStr[ethLuckyHistoryModel.betType];
//             });
//             minute10ValueModel.add(model);
//           }
//         });
//       }
//     });
//   }
//
//   void ethLuckyBet({Function success}){
//     if(super.loading || basePageDto.totalPages == basePageDto.pageIndex) {
//       return;
//     }
//     basePageDto.pageIndex+=1;
//     this.getPages(basePageDto.toJson(),path: "/eth/lucky/bet",success: (value){
//       if(ethLuckyBetDataModels == null || basePageDto.pageIndex == 1) {
//         ethLuckyBetDataModels = value.data;
//       }else {
//         ethLuckyBetDataModels.addAll(value.data);
//       }
//       basePageDto.totalPages = value.totalPages;
//     });
//   }
//
//
//
//   void ethLuckyBankerPost(EthLuckyBankerPostDto dto,{Function success}){
//     this.post(dto.toJson(),path: "/eth/lucky/banker",success: (data){
//       if(success != null) {
//         success(data);
//       }
//     });
//   }
//
//   void ethLuckyBankerDelete(EthLuckyBankerDeleteDto dto,{Function success}){
//     this.delete(dto.toJson(),path: "/eth/lucky/banker",success: (data){
//       if(success != null) {
//         success(data);
//       }
//     });
//   }
//
//   void ethLuckyBetType({Function success}) {
//     this.get({},path: "/eth/lucky/betType",success: (data){
//       if (data != null) {
//         ethLuckyBettypeGetModels = [];
//         data.forEach((v) {
//           ethLuckyBettypeGetModels.add(EthLuckyBettypeGetModel.fromJson(v));
//         });
//         print(data);
//       }
//     });
//   }
//
//
//   void ethLuckyPost(List<EthLuckyPostDto> dtos,{Function success}){
//     debugPrint(jsonEncode(dtos));
//     this.post({},data: jsonEncode(dtos),path: "/eth/lucky",success: (data){
//       if(success != null) {
//         success(data);
//       }
//     });
//   }
//
//   void _scrollListener() {
//     if (scrollController.position.extentAfter < 1) {
//       this.ethLuckyBet();
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
