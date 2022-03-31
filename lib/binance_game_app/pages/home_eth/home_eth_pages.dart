// import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
// import 'package:binance_game_app_single/binance_game_app/model/bet_icon/bet_icon_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_banker/btc_lucky_banker_currentbanker_data_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/eth_lucky_banker/eth_lucky_banker_bankerqueuemap_data_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/eth_lucky_banker/eth_lucky_banker_currentbanker_data_model.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_eth/widget/banker_list_row.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_eth/widget/default_bet_row.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_eth/widget/head_period_number_row.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_eth/widget/latest_news.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_eth/widget/nearly_10_minutes_subtitle.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_eth/widget/nearly_10_minutes_table.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/auth/auth_view_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/eth/eth_lucky_view_model.dart';
// import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
// import 'package:binance_game_app_single/binance_game_app/widget/bg_container/index.dart';
// import 'package:binance_game_app_single/binance_game_app/widget/bg_home_app_bar/index.dart';
// import 'package:binance_game_app_single/binance_game_app/widget/bg_kline_1m_card/index.dart';
// import 'package:binance_game_app_single/binance_game_app/widget/bg_radio_group/index.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';
// import 'package:provider/provider.dart';
// import 'package:tuple/tuple.dart';
//
//
// class HomeEthPages extends StatelessWidget {
//
//   HomeEthPages({Key key}) : super(key: key);
//
//   PreferredSizeWidget appBar(BuildContext context) {
//     return BgHomeAppBar(usdt: 2615.27).build(context);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     print("HomeBtcPages build 111 222 333");
//     ThemeData theme = Theme.of(context);
//
//     final List<BetIconModel> _betList = [
//       BetIconModel(selectUrl: '1_on',text: "1",url: "1",style: theme.primaryTextTheme.headline1),
//       BetIconModel(selectUrl: '10_on',text: "10",url: "10",style: theme.primaryTextTheme.headline1.copyWith(color: ThemeColors.COLOR_738ADA)),
//       BetIconModel(selectUrl: '50_on',text: "50",url: "50",style: theme.primaryTextTheme.headline1.copyWith(color: ThemeColors.COLOR_E96277)),
//       BetIconModel(selectUrl: '100_on',text: "100",url: "100",style: theme.primaryTextTheme.headline1.copyWith(color: ThemeColors.COLOR_38B277)),
//       BetIconModel(selectUrl: 'zj_on',text: "自选",url: "zj",style: theme.primaryTextTheme.headline1.copyWith(color: ThemeColors.COLOR_D27444)),
//     ];
//
//
//     return ListView(
//       cacheExtent: 2000,
//       children: [
//         8.sxh,
//         //期号 //收盘价
//         HeadPeriodNumberRow(point: 2,lotteryResults: '98',),
//         8.sxh,
//         //游戏区,下注区域
//         Container(
//           width: 375.w,
//           padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 16.h),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
//           ),
//           child: Column(
//             children: [
//               //最近消息
//               LatestNews(),
//               8.sxh,
//               Divider(thickness: 1,height: 0.h,),
//               // //庄家
//               // BankerListRow(flag: true,),
//               // //庄家
//               // BankerListRow(),
//
//               Selector<EthLuckyViewModel,Tuple2<EthLuckyBankerCurrentbankerDataModel,List<EthLuckyBankerBankerqueuemapDataModel>>>(
//                 builder: (BuildContext context,value, Widget child) {
//                   AuthViewModel authViewModel = Provider.of<AuthViewModel>(context,listen: false);
//                   bool flag = authViewModel.model.id == value.item1.userId;
//
//                   if(!flag) {
//                     flag = value.item2.firstWhere((element) => element.id == authViewModel.model.id,orElse: () => null) != null;
//                   }
//                   return BankerListRow(data: value.item1,bankerType: "NN",flag: flag,);
//                 },
//                 selector: (BuildContext context, EthLuckyViewModel model) {
//                   return Tuple2(model.ethLuckyBankerGetModel.currentBanker.nn,model.ethLuckyBankerGetModel.bankerQueueMap.nn);
//                 },
//               ),
//
//               Selector<EthLuckyViewModel,Tuple2<EthLuckyBankerCurrentbankerDataModel,List<EthLuckyBankerBankerqueuemapDataModel>>>(
//                 builder: (BuildContext context,value, Widget child) {
//                   AuthViewModel authViewModel = Provider.of<AuthViewModel>(context,listen: false);
//                   bool flag = authViewModel.model.id == value.item1.userId;
//
//                   if(!flag) {
//                     flag = value.item2.firstWhere((element) => element.id == authViewModel.model.id,orElse: () => null) != null;
//                   }
//                   return BankerListRow(data: value.item1,bankerType: "DUI",flag: flag,);
//                 },
//                 selector: (BuildContext context, EthLuckyViewModel model) {
//                   return Tuple2(model.ethLuckyBankerGetModel.currentBanker.dui,model.ethLuckyBankerGetModel.bankerQueueMap.dui);
//                 },
//               ),
//
//
//               8.sxh,
//               //最高价,最低价
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   BgContainer.kLine1mCard(
//                     child: BgKline1mCard(
//                       point: 2,
//                       title: "最高价",
//                       currency: "BTC/USDT",
//                       price: "34393.65",
//                       betCount: "368",
//                       lotteryResults: '00',
//                     ),
//                   ),
//                   BgContainer.kLine1mCard(
//                     child: BgKline1mCard(
//                       point: 2,
//                       title: "最低价",
//                       currency: "BTC/USDT",
//                       price: "34393.65",
//                       betCount: "846",
//                       lotteryResults: '00',
//                     ),
//                   ),
//                 ],
//               ),
//               8.sxh,
//               //押注
//               BgRadioGroup(
//                 width: 110.w,
//                 height: 50.h,
//                 borderRadius: BorderRadius.circular(5.r),
//                 crossAxisCount: 3,
//                 unselectedBackgroundColor: ThemeColors.COLOR_747884,
//                 selectedBackgroundColor: ThemeColors.COLOR_F7F7F7,
//                 selectedTextColor: ThemeColors.COLOR_747884,
//                 unselectedTextColor: Colors.white,
//                 valueBetOns: [0,0,0],
//                 yourValueBetOns: [0,0,0],
//                 textStyle: MaterialStateProperty.all(Theme.of(context).accentTextTheme.headline4),
//                 values: [
//                   "1-5对子",
//                   "对子",
//                   "6-9对子"
//                 ],
//                 callback: (index){
//
//                 },
//               ),
//
//               8.sxh,
//               //押注
//               BgRadioGroup(
//                 width: 62.5.w,
//                 height: 35.h,
//                 maxLine: 2,
//                 crossAxisCount: 5,
//                 borderRadius: BorderRadius.circular(5.r),
//                 unselectedBackgroundColor: ThemeColors.COLOR_747884,
//                 selectedBackgroundColor: ThemeColors.COLOR_F7F7F7,
//                 selectedTextColor: ThemeColors.COLOR_747884,
//                 unselectedTextColor: Colors.white,
//                 valueBetOns: List.generate(10, (index) => 100.0 * index).toList(),
//                 yourValueBetOns: [0,0,1,0,0,0,0,0,0,0],
//                 initIndex: 0,
//                 textStyle: MaterialStateProperty.all(Theme.of(context).accentTextTheme.headline4),
//                 values: List.generate(10, (index) => "$index" * 2).toList(),
//                 callback: (index){
//                 },
//               ),
//               12.sxh,
//               DefaultBetRow(betList: _betList,),
//               8.sxh,
//               BgButtonBars.reverseGR(
//                 padding: EdgeInsets.symmetric(horizontal: 51.w,vertical: 12.h),
//                 values: ["取消投注","确认投注"],
//               ),
//             ],
//           ),
//         ),
//         Nearly10MinutesSubtitle(),
//         Nearly10MinutesTable(),
//       ],
//     );
//   }
// }
