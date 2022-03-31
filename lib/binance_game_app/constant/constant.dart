

import 'package:binance_game_app_single/binance_game_app/model/about_us/about_us_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/home_assets/card_item_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/invite_rewards_card2_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/sharing_channels/sharing_channels_model.dart';
import 'package:binance_game_app_single/binance_game_app/pages/charge_usdt/charge_usdt_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_about_us/home_assets_about_us_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_alert/home_assets_alert_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_invite_rewards/home_assets_invite_rewards_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_online_customer/home_assets_online_customer_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/music_settings/music_settings_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/transfer_usdt/transfer_usdt_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/withdrawal_usdt/withdrawal_usdt_pages.dart';
import 'package:flutter/cupertino.dart';

class Constant {


  static String domainUrl = "127.0.0.1";
  static final baseUrl = "http://$domainUrl:8880/";
  // static final baseUrl = "http://192.168.7.47:8080/";
  // static final baseUrl = "https://bedside.yhkml.com/";
  // static final baseUrl = "http://test-bedside.yhkml.com/";

  static final String AUTHORIZATION = "token";

  static final List<String> tabValues = [
    'ERC',
    'TRC20',
  ];

  static final  Map<String,String> enumTypeToStr = {
    "NN": "牛牛庄家",
    "SN": "扫牛庄家",
    "DUI": "对子庄家",
    "NIL": "无牛",
    "NIU_1": "牛一",
    "NIU_2": "牛二",
    "NIU_3": "牛三",
    "NIU_4": "牛四",
    "NIU_5": "牛五",
    "NIU_6": "牛六",
    "NIU_7": "牛七",
    "NIU_8": "牛八",
    "NIU_9": "牛九",
    "NIU_NIU": "牛牛",
    "BET_1": "最高价",
    "BET_2": "最低价",
  };

  static final List<SharingChannelsModel> sharingChannelsModels = [
    SharingChannelsModel(title: "微信好友",icon: "binance_game_app_assets/images/wechat_share_icon.png"),
    SharingChannelsModel(title: "微信朋友圈",icon: "binance_game_app_assets/images/moments_share_icon.png"),
    SharingChannelsModel(title: "Telegram",icon: "binance_game_app_assets/images/telegram_share_icon.png"),
    SharingChannelsModel(title: "保存图片",icon: "binance_game_app_assets/images/save_share_icon.png"),
  ];

  static final List<InviteRewardsCard2Model> inviteRewardsCard2Models = [
    InviteRewardsCard2Model(title: "邀请人数",icon: "binance_game_app_assets/images/home_assets_invite_rewards_numbers_icon.png.png",value: 1),
    InviteRewardsCard2Model(title: "我的返利(USDT)",icon: "binance_game_app_assets/images/home_assets_invite_rewards_rebate_icon.png",value: 738.36),
  ];


  static final List<CardItemModel> cardItemModels = [
    CardItemModel(title: "邀请奖励",icon: "home_assets_invite_rewards_icon.png",routerName: HomeAssetsInviteRewardsPages.routeName),
    CardItemModel(title: "消息通知",icon: "home_assets_alert_icon.png",routerName: HomeAssetsAlertPages.routeName),
    CardItemModel(title: "音乐设置",icon: "home_assets_music_setting_icon.png",routerName: MusicSettingsPages.routeName),
    CardItemModel(title: "清空缓存",icon: "home_assets_clear_cache_icon.png",routerName: HomeAssetsAlertPages.routeName),
    CardItemModel(title: "在线客服",icon: "home_assets_online_customer_icon.png",routerName: HomeAssetsOnlineCustomerPages.routeName),
    CardItemModel(title: "关于我们",icon: "home_assets_about_us_icon.png",routerName: HomeAssetsAboutUsPages.routeName),
  ];

  static final List<AboutUsModel> aboutUsModels = [
    AboutUsModel(title: "欢迎添加我们的电报客服@***",subTitle: ""),
    AboutUsModel(title: "检查更新",subTitle: "您当前版本为最新版本"),
  ];

  static final List<String> homeAssetsBodyButtonUrls = [
    ChargeUsdtPages.routeName,
    WithdrawalUsdtPages.routeName,
    TransferUsdtPages.routeName,
  ];

}
