// import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
// import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
// import 'package:binance_game_app_single/binance_game_app/dto/btc_lucky_post/btc_lucky_post_dto.dart';
// import 'package:binance_game_app_single/binance_game_app/dto/btc_lucky_post/btc_lucky_post_dto.dart';
// import 'package:binance_game_app_single/binance_game_app/model/bet_icon/bet_icon_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_banker/btc_lucky_banker_bankerqueuemap_data_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_banker/btc_lucky_banker_currentbanker_data_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_banker/btc_lucky_banker_get_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_bettype/btc_lucky_bettype_get_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_current_issue_data/btc_lucky_current_issue_data_model.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_btc/self_selected/self_selected_pages.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/banker_list_row.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/default_bet_row.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/head_period_number_row.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/high_low_row.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/latest_news.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/nearly_10_minutes_subtitle.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/nearly_10_minutes_table.dart';
// import 'package:binance_game_app_single/binance_game_app/utils/bg_show_general_dialog.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/auth/auth_view_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/user/user_view_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/ws/handler/countdown_response_handler.dart';
// import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
// import 'package:binance_game_app_single/binance_game_app/widget/bg_container/index.dart';
// import 'package:binance_game_app_single/binance_game_app/widget/bg_home_app_bar/index.dart';
// import 'package:binance_game_app_single/binance_game_app/widget/bg_kline_1m_card/index.dart';
// import 'package:binance_game_app_single/binance_game_app/widget/bg_radio_group/index.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';
// import 'package:provider/provider.dart';
// import 'package:tuple/tuple.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
//
// class HomeBtcPages extends StatelessWidget {
//
//   HomeBtcPages({Key key}) : super(key: key);
//
//   PreferredSizeWidget appBar(BuildContext context) {
//     return BgHomeAppBar(usdt: 2615.27).build(context);
//   }
//
//   String niuBetType;
//   String betType;
//   int niuAmount;
//
//   @override
//   Widget build(BuildContext context) {
//     print("HomeBtcPages build");
//     BtcLuckyViewModel btcLuckyViewModel = Provider.of<BtcLuckyViewModel>(context,listen: false);
//     UserViewModel userViewModel = Provider.of<UserViewModel>(context,listen: false);
//     CountdownResponseHandler countdownResponseHandler = Provider.of<CountdownResponseHandler>(context,listen: false);
//
//     ThemeData theme = Theme.of(context);
//     final List<BetIconModel> _betList = [
//       BetIconModel(selectUrl: '1_on',text: "1",url: "1",style: theme.primaryTextTheme.headline1),
//       BetIconModel(selectUrl: '10_on',text: "10",url: "10",style: theme.primaryTextTheme.headline1.copyWith(color: ThemeColors.COLOR_738ADA)),
//       BetIconModel(selectUrl: '50_on',text: "50",url: "50",style: theme.primaryTextTheme.headline1.copyWith(color: ThemeColors.COLOR_E96277)),
//       BetIconModel(selectUrl: '100_on',text: "100",url: "100",style: theme.primaryTextTheme.headline1.copyWith(color: ThemeColors.COLOR_38B277)),
//       BetIconModel(selectUrl: 'zj_on',text: "自选",url: "zj",style: theme.primaryTextTheme.headline1.copyWith(color: ThemeColors.COLOR_D27444)),
//     ];
//
//
//     return RefreshIndicator(
//       onRefresh: () async {
//         await Future<Null>.delayed(Duration(milliseconds: 900),(){
//
//           userViewModel.user();
//           btcLuckyViewModel.btcLuckyBanker();
//           btcLuckyViewModel.btcLuckyBetType();
//           btcLuckyViewModel.btcLuckyCurrentIssueData();
//           btcLuckyViewModel.btcLuckyHistory();
//         });
//       },
//       child: ListView(
//         cacheExtent: 2000,
//         children: [
//           8.sxh,
//           HeadPeriodNumberRow(),
//           8.sxh,
//           Container(
//             width: 375.w,
//             padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 16.h),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
//             ),
//             child: Column(
//               children: [
//                 LatestNews(),
//                 8.sxh,
//                 Divider(thickness: 1,height: 0.h,),
//
//                 Selector<BtcLuckyViewModel,Tuple2<BtcLuckyBankerCurrentbankerDataModel,List<BtcLuckyBankerBankerqueuemapDataModel>>>(
//                   builder: (BuildContext context,value, Widget child) {
//                     AuthViewModel authViewModel = Provider.of<AuthViewModel>(context,listen: false);
//                     bool flag = authViewModel.model.id == value.item1.userId;
//
//                     if(!flag) {
//                       flag = value.item2.firstWhere((element) => element.id == authViewModel.model.id,orElse: () => null) != null;
//                     }
//                     return BankerListRow(data: value.item1,bankerType: "NN",flag: flag,);
//                   },
//                   selector: (BuildContext context, BtcLuckyViewModel model) {
//                     return Tuple2(model.btcLuckyBankerGetModel.currentBanker.nn,model.btcLuckyBankerGetModel.bankerQueueMap.nn);
//                   },
//                 ),
//
//                 Selector<BtcLuckyViewModel,Tuple2<BtcLuckyBankerCurrentbankerDataModel,List<BtcLuckyBankerBankerqueuemapDataModel>>>(
//                   builder: (BuildContext context,value, Widget child) {
//                     AuthViewModel authViewModel = Provider.of<AuthViewModel>(context,listen: false);
//                     bool flag = authViewModel.model.id == value.item1.userId;
//                     if(!flag) {
//                       flag = value.item2.firstWhere((element) => element.id == authViewModel.model.id,orElse: () => null) != null;
//                     }
//                     return BankerListRow(data: value.item1,bankerType: "SN",flag: flag,);
//                   },
//                   selector: (BuildContext context, BtcLuckyViewModel model) {
//                     return Tuple2(model.btcLuckyBankerGetModel.currentBanker.sn,model.btcLuckyBankerGetModel.bankerQueueMap.sn);
//                   },
//                 ),
//
//                 8.sxh,
//                 HighLowRow(callback: (index){
//                   debugPrint("index = ${index}");
//                   if(index == 0) {
//                     betType = "BET_1";
//                   }else if(index == 1) {
//                     betType = "BET_2";
//                   }else {
//                     betType = null;
//                   }
//
//                 },),
//                 8.sxh,
//                 8.sxh,
//
//                 Selector(
//                   builder: (BuildContext context,List<BtcLuckyBettypeGetModel> value, Widget child) {
//                     return BgRadioGroup(
//                       width: 62.5.w,
//                       height: 35.h,
//                       maxLine: 2,
//                       crossAxisCount: 5,
//                       borderRadius: BorderRadius.circular(5.r),
//                       unselectedBackgroundColor: ThemeColors.COLOR_F9F7F3,
//                       selectedBackgroundColor: ThemeColors.COLOR_747884,
//                       selectedTextColor: Colors.white,
//                       unselectedTextColor: ThemeColors.COLOR_E8B663,
//                       valueBetOns:  List.generate(10, (index) => value[index].top.toDouble()),
//                       yourValueBetOns:  List.generate(10, (index) => value[index].bet?.toDouble() ?? 0.00),
//                       initIndex: null,
//                       textStyle: MaterialStateProperty.all(Theme.of(context).accentTextTheme.headline2),
//                       values: List.generate(10, (index) => value[index].betType),
//                       callback: (index){
//                         if(index == null) {
//                           niuBetType = null;
//                         }else {
//                           niuBetType = value[index].betType;
//                         }
//                       },
//                     );
//                   },
//                   selector: (BuildContext context , BtcLuckyViewModel model) {
//                     return model.btcLuckyBettypeGetModels;
//                   },
//                 ),
//                 12.sxh,
//                 DefaultBetRow(betList: _betList,callback: (BetIconModel model){
//                   if(model.text == "自选") {
//                     BgShowGeneralDialog.build(builder: SelfSelectedPages(callback: (value){
//                       niuAmount = int.parse(value);
//                     },niuAmount: niuAmount,),context: context);
//                   }else {
//                     niuAmount = int.parse(model.text);
//                   }
//                 },),
//                 8.sxh,
//                 BgButtonBars.reverseGR(
//                   padding: EdgeInsets.symmetric(horizontal: 51.w,vertical: 8.h),
//                   values: ["取消投注","确认投注"],
//                   callback: (index){
//                     if(index == 1) {
//
//                       if(2 != countdownResponseHandler.lotteryType) {
//                         EasyLoading.showToast("投注已停止");
//                         return;
//                       }
//                       if(niuBetType == null && betType == null) {
//                         EasyLoading.showToast("请选择下注的点数");
//                         return;
//                       }
//                       if(niuAmount == null) {
//                         EasyLoading.showToast("请选择下注的注码");
//                         return;
//                       }
//
//                       List<BtcLuckyPostDto> _list = [];
//
//                       if(niuBetType != null) {
//                         BtcLuckyPostDto niuDto = BtcLuckyPostDto();
//                         niuDto.betType = niuBetType;
//                         niuDto.amount = niuAmount;
//                         _list.add(niuDto);
//                       }
//
//                       if(betType != null) {
//                         BtcLuckyPostDto niuDto = BtcLuckyPostDto();
//                         niuDto.betType = betType;
//                         niuDto.amount = niuAmount;
//                         _list.add(niuDto);
//                       }
//
//
//                       btcLuckyViewModel.btcLuckyPost(_list,success: (data){
//
//                         userViewModel.user();
//                         btcLuckyViewModel.btcLuckyBanker();
//                         btcLuckyViewModel.btcLuckyBetType();
//                         btcLuckyViewModel.btcLuckyCurrentIssueData();
//
//                         EasyLoading.showToast("下注成功");
//                       });
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Nearly10MinutesSubtitle(),
//           Nearly10MinutesTable(),
//         ],
//       ),
//     );
//   }
// }
