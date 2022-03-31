import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/handler/message_handler.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/invocation_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/message/countdown_request.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_bet_record/home_bet_record_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_btc/home_btc_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_eth/home_eth_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_new_btc/home_new_btc_pages.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/account/account_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/auth/auth_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/betconfig/betconfig_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/betrecord/betrecord_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/eth/eth_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/klines/klines_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/user/user_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/ws/handler/countdown_response_handler.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/ws/handler/heartbeat_response_handler.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/ws/ws_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class HomePages extends StatefulWidget {

  static const routeName = '/homePages';

  const HomePages({Key key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {

  int _current = 2;



  List<Widget> _body;
  HomeBetRecordPages _homeBetRecordPages;
  HomeAssetsPages _homeAssetsPages;
  HomeNewBtcPages _homeNewBtcPages;

  List<Function> _appbars;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      AccountViewModel authViewModel = Provider.of<AccountViewModel>(context,listen: false);
      authViewModel.info();

      BetrecordViewModel betrecordViewModel = Provider.of<BetrecordViewModel>(context,listen: false);
      betrecordViewModel.betrecordList();

      KlinesViewModel klinesViewModel = Provider.of<KlinesViewModel>(context,listen: false);
      klinesViewModel.history();
      klinesViewModel.currentIssueNo();
      klinesViewModel.initStream();

      BetconfigViewModel betconfigViewModel = Provider.of<BetconfigViewModel>(context,listen: false);
      betconfigViewModel.list();
    });
    _homeNewBtcPages = HomeNewBtcPages();
    _homeBetRecordPages = HomeBetRecordPages();
    _homeAssetsPages = HomeAssetsPages();

    _body  = [
      _homeNewBtcPages,
      _homeBetRecordPages,
      _homeAssetsPages,
    ];
    _appbars = [
      _homeNewBtcPages.appBar,
      _homeBetRecordPages.appBar,
      _homeAssetsPages.appBar,
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbars[_current](context),
      backgroundColor: ThemeColors.COLOR_F7F7F7,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current,
        onTap: (index) {
          setState(() {
            _current = index;
            if(_current == 1) {
              BetrecordViewModel betrecordViewModel = Provider.of<BetrecordViewModel>(context,listen: false);
              betrecordViewModel.basePageDto.page = 0;
              betrecordViewModel.betrecordList();
            }
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "BTC",
            icon: Image.asset("binance_game_app_assets/images/btc_nav_icon.png"),
            activeIcon: Image.asset("binance_game_app_assets/images/btc_nav_on_icon.png"),
          ),
          BottomNavigationBarItem(
            label: "Bet",
            icon: Image.asset("binance_game_app_assets/images/bet_record_nav_icon.png"),
            activeIcon: Image.asset("binance_game_app_assets/images/bet_record_nav_on_icon.png"),
          ),
          BottomNavigationBarItem(
            label: "Assets",
            icon: Image.asset("binance_game_app_assets/images/assets_nav_icon.png"),
            activeIcon: Image.asset("binance_game_app_assets/images/assets_nav_on_icon.png"),
          ),
        ],
      ),
      body: _body[_current],
    );
  }


}
