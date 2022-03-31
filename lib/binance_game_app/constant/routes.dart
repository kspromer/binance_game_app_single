import 'package:binance_game_app_single/binance_game_app/pages/add_new_address/add_new_address_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/charge_usdt/charge_usdt_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home/home_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_about_us/home_assets_about_us_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_alert/home_assets_alert_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_invite_rewards/home_assets_invite_rewards_mine_invite/home_assets_invite_rewards_mine_invite_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_invite_rewards/home_assets_invite_rewards_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_online_customer/home_assets_online_customer_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/login/login_code_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/login/login_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/music_settings/music_settings_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/quick_buy_coin/quick_buy_coin_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/register/register_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/transfer_usdt/transfer_usdt_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/withdrawal_address_list/withdrawal_address_list_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/withdrawal_usdt/withdrawal_usdt_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> routes = {
  //音乐设置
  MusicSettingsPages.routeName : (context) => MusicSettingsPages(),
  //充值USDT
  ChargeUsdtPages.routeName : (context) => ChargeUsdtPages(),
  //提现USDT
  WithdrawalUsdtPages.routeName : (context) => WithdrawalUsdtPages(),
  //添加新地址USDT
  AddNewAddressPages.routeName : (context) => AddNewAddressPages(),
  //提现地址列表
  WithdrawalAddressListPages.routeName : (context) => WithdrawalAddressListPages(),
  //转账usdt
  TransferUsdtPages.routeName : (context) => TransferUsdtPages(),
  //主页页面
  HomePages.routeName : (context) => HomePages(),
  //资产页面消息通知
  HomeAssetsAlertPages.routeName : (context) => HomeAssetsAlertPages(),
  //关于我们
  HomeAssetsAboutUsPages.routeName : (context) => HomeAssetsAboutUsPages(),
  //邀请好友
  HomeAssetsInviteRewardsPages.routeName : (context) => HomeAssetsInviteRewardsPages(),
  //注册
  RegisterPages.routeName : (context) => RegisterPages(),
  //登录
  LoginPages.routeName : (context) => LoginPages(),
  //登录根据验证码
  LoginCodePages.routeName : (context) => LoginCodePages(),
  //我的邀请
  HomeAssetsInviteRewardsMineInvitePages.routeName : (context) => HomeAssetsInviteRewardsMineInvitePages(),
  //快捷买币页面
  QuickBuyCoinPages.routeName : (context) => QuickBuyCoinPages(),
  //在线客服
  HomeAssetsOnlineCustomerPages.routeName : (context) => HomeAssetsOnlineCustomerPages(),
};


final RouteFactory onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageHandler = routes[name];
  if (pageHandler != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(builder: (context) => pageHandler(context,arguments: settings.arguments));
      return route;
    }else {
      final Route route = CupertinoPageRoute(builder: (context) => pageHandler(context));
      return route;
    }
  }
};