import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/dto/auth_code/auth_code_dto.dart';
import 'package:binance_game_app_single/binance_game_app/dto/login/login_dto.dart';
import 'package:binance_game_app_single/binance_game_app/dto/page/base_page_dto.dart';
import 'package:binance_game_app_single/binance_game_app/dto/register/register_dto.dart';
import 'package:binance_game_app_single/binance_game_app/model/account/account_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/message/message_list.dart';
import 'package:binance_game_app_single/binance_game_app/utils/md5.dart';
import 'package:dio/dio.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

class MessageViewModel extends BaseViewModel {


  BasePageDto basePageDto = BasePageDto(page: 0,limit: 10,totalPages: 99);

  List<MessageList> messageList;

  ScrollController scrollController = ScrollController();

  BetrecordViewModel(){
    scrollController.addListener(_scrollListener);
  }

  void list({Function success}) {
    if(super.loading || basePageDto.totalPages <= basePageDto.page) {
      return;
    }
    basePageDto.page+=1;
    this.getPages(basePageDto.toJson(),path: "/app/binancegame/message/list",success: (value){
      Message v = Message.fromJson(value.data);
      if (v.list.isEmpty) {
        return;
      }
      if(messageList == null || basePageDto.page == 1) {
        messageList = v.list;
      }else {
        messageList.addAll(v.list);
      }
      messageList = [...messageList];
      basePageDto.totalPages = v.totalPage;
    });
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 1) {
      this.list();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

}