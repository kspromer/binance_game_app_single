import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/dto/betrecord/betrecord_bet_dto.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_btc/apply_banker/apply_backer_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/head_period_number_row.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/latest_news.dart';
import 'package:binance_game_app_single/binance_game_app/utils/bg_show_general_dialog.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/account/account_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/betconfig/betconfig_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/betrecord/betrecord_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/klines/klines_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_home_app_bar/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_radio_group/index.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeNewBtcPages extends StatelessWidget {

  HomeNewBtcPages({Key key}) : super(key: key);


  PreferredSizeWidget appBar(BuildContext context) {
    return BgHomeAppBar(bottom: PreferredSize(
      preferredSize: Size(0.w, 0.h),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ThemeColors.COLOR_F7F7F7,
        ),
      ),
    )).build(context);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    BetconfigViewModel model = Provider.of<BetconfigViewModel>(context,listen: false);
    AccountViewModel accountViewModel = Provider.of<AccountViewModel>(context,listen: false);
    BetrecordViewModel betrecordViewModel = Provider.of<BetrecordViewModel>(context,listen: false);
    KlinesViewModel klinesViewModel = Provider.of<KlinesViewModel>(context,listen: false);
    return RefreshIndicator(
      onRefresh: () async {
        model.list();
        klinesViewModel.currentIssueNo();
        klinesViewModel.history();
        accountViewModel.info();
        return Future.delayed(Duration(seconds: 2));
      },
      child: ListView(
        children: [
          HeadPeriodNumberRow(),
          SizedBox(height: 8.h,),
          Container(
            width: 375.w,
            padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
            ),
            child: Column(
              children: [
                LatestNews(title: "History Record",),
                SizedBox(height: 10.h,),
                Container(
                  height: 258.h,
                  child: Consumer<KlinesViewModel>(
                    builder: (_,model,child){
                      debugPrint("BgListTile.userInfo rebuild");
                      if(model.klinesHistorys == null){
                        return child;
                      }
                      return GridView.count(
                        crossAxisCount: 10,
                        childAspectRatio: 34.5 / 40,
                        children: List.generate(model.klinesHistorys.length, (i) {
                          return Container(
                            height: 40.h,
                            alignment: Alignment.center,
                            color: (i / 10).toInt().isEven ? ThemeColors.COLOR_B6B6B6.withOpacity(0.15) : Colors.white,
                            child: Text("${model.klinesHistorys[i].result}",
                              style: theme.accentTextTheme.headline4.copyWith(fontWeight: FontWeight.w800,color: i.isEven ? ThemeColors.COLOR_CB4055 : ThemeColors.COLOR_08A067),
                            ),
                          );
                        }),
                      );
                    },
                    child: GridView.count(
                      crossAxisCount: 10,
                      childAspectRatio: 34.5 / 40,
                      children: List.generate(60, (i) {
                        return Container(
                          height: 40.h,
                          alignment: Alignment.center,
                          color: (i / 10).toInt().isEven ? ThemeColors.COLOR_B6B6B6.withOpacity(0.15) : Colors.white,
                          child: Text("${i ~/ 10}",
                            style: theme.accentTextTheme.headline4.copyWith(fontWeight: FontWeight.w800,color: i.isEven ? ThemeColors.COLOR_CB4055 : ThemeColors.COLOR_08A067),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                LatestNews(title: "Bet (Throw back)",),
                SizedBox(height: 10.h,),
                BgRadioGroup(
                  width: 80.w,
                  height: 50.h,
                  maxLine: 2,
                  crossAxisCount: 4,
                  borderRadius: BorderRadius.circular(20.r),
                  unselectedBackgroundColor: ThemeColors.COLOR_747884,
                  selectedBackgroundColor: ThemeColors.COLOR_747884,
                  unselectedTextColor: ThemeColors.COLOR_E8B663,
                  valueBetOns:  List.generate(8, (index) => model.betconfigList.sublist(0,8)[index].odds),
                  initIndex: null,
                  textStyle: MaterialStateProperty.all(Theme.of(context).accentTextTheme.headline2.copyWith(fontSize: 18.sp)),
                  values: List.generate(8, (index) => "${model.betconfigList.sublist(0,8)[index].point}"),
                  callback: (index) {
                    BgShowGeneralDialog.build(builder: ApplyBackerPages(callback: (money){
                      BetrecordBetDto dto = BetrecordBetDto();
                      dto.point = model.betconfigList.sublist(0,8)[index].point;
                      dto.money = double.parse(money);
                      betrecordViewModel.bet(dto,success: (data) {
                        Navigator.of(context).pop();
                        accountViewModel.info();
                      });
                    },),context: context);
                  },
                ),
                SizedBox(height: 10.h,),
                BgRadioGroup(
                  width: 169.w,
                  height: 50.h,
                  maxLine: 1,
                  crossAxisCount: 2,
                  borderRadius: BorderRadius.circular(20.r),
                  unselectedBackgroundColor: ThemeColors.COLOR_747884,
                  selectedBackgroundColor: ThemeColors.COLOR_747884,
                  unselectedTextColor: ThemeColors.COLOR_E8B663,
                  valueBetOns:  List.generate(2, (index) => model.betconfigList.sublist(8,10)[index].odds),
                  initIndex: null,
                  textStyle: MaterialStateProperty.all(Theme.of(context).accentTextTheme.headline2.copyWith(fontSize: 18.sp)),
                  values: List.generate(2, (index) => "${model.betconfigList.sublist(8,10)[index].point}"),
                  callback: (index) {
                    BgShowGeneralDialog.build(builder: ApplyBackerPages(callback: (money){
                      BetrecordBetDto dto = BetrecordBetDto();
                      dto.point = model.betconfigList.sublist(8,10)[index].point;
                      dto.money = double.parse(money);
                      betrecordViewModel.bet(dto,success: (data) {
                        Navigator.of(context).pop();
                        accountViewModel.info();
                      });
                    },),context: context);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
