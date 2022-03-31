import 'package:binance_game_app_single/binance_game_app/dto/auth_code/auth_code_dto.dart';
import 'package:binance_game_app_single/binance_game_app/dto/betrecord/betrecord_bet_dto.dart';
import 'package:binance_game_app_single/binance_game_app/dto/page/base_page_dto.dart';
import 'package:binance_game_app_single/binance_game_app/model/account/account_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/bet_record/bet_record_model.dart';
import 'package:dio/dio.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

class BetrecordViewModel extends BaseViewModel {

  BetRecordModel model;

  List<BetRecordModelList> betRecordModelList;

  ScrollController scrollController = ScrollController();

  BasePageDto basePageDto = BasePageDto(page: 0,limit: 10,totalPages: 99);

  BetrecordViewModel(){
    scrollController.addListener(_scrollListener);
  }
  
  void bet(BetrecordBetDto dto,{Function success}) {
    this.post({},data: dto.toJson(),path: "/app/binancegame/betrecord/bet",success: (data) {
      success(data);
    });
  }

  void betrecordList({Function success}) {
    if(super.loading || basePageDto.totalPages <= basePageDto.page) {
      return;
    }
    basePageDto.page+=1;
    this.getPages(basePageDto.toJson(),path: "/app/binancegame/betrecord/list",success: (value){
      BetRecordModel v = BetRecordModel.fromJson(value.data);
      if (v.list.isEmpty) {
        return;
      }
      if(betRecordModelList == null || basePageDto.page == 1) {
        betRecordModelList = v.list;
      }else {
        betRecordModelList.addAll(v.list);
      }
      basePageDto.totalPages = v.totalPage;
    });
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 1) {
      this.betrecordList();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

}