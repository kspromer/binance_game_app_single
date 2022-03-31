import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_current_issue_data/btc_lucky_current_issue_data_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/message/countdown_response.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/account/account_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/betconfig/betconfig_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/betrecord/betrecord_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/klines/klines_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/ws/handler/countdown_response_handler.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_container/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_kline_1m_card/index.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HeadPeriodNumberRow extends StatelessWidget {

  final int point;

  final String lotteryResults;

  const HeadPeriodNumberRow({Key key, this.point, this.lotteryResults}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("HeadPeriodNumberRow rebuild");
    ThemeData theme = Theme.of(context);
    var styleF17W5CH = theme.accentTextTheme.headline5;
    var styleF17W9CH = styleF17W5CH.copyWith(fontWeight: FontWeight.w900);

    AccountViewModel accountViewModel = Provider.of<AccountViewModel>(context,listen: false);
    BetrecordViewModel betrecordViewModel = Provider.of<BetrecordViewModel>(context,listen: false);
    KlinesViewModel klinesViewModel = Provider.of<KlinesViewModel>(context,listen: false);

    return Row(
      children: [
        SizedBox(width: 9.w),
        BgContainer.kLine1mCard(
          child: Consumer<KlinesViewModel>(
            builder: (_,model,child){
              if(model.klinesHistorys == null){
                return child;
              }
              return BgKline1mCard(
                lotteryResults: "BTC/USDT",
                point: 3,
                title: "Closing Price",
                currency: "BTC/USDT",
                price: "${model.klinesHistorys[0].close.toStringAsFixed(2)}",
              );
            },
            child: BgKline1mCard(
              lotteryResults: "BTC/USDT",
              point: 3,
              title: "Closing Price",
              currency: "BTC/USDT",
              price: "34393.65",
            ),
          ),
        ),
        SizedBox(width: 18.w),
        Container(
          height: 83.h,
          width: 170.w,
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 8.h),
              Consumer<KlinesViewModel>(
                builder: (_,model,child){
                  if(model.klinesCurrentissueno == null) {
                    return child;
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Phase",style: styleF17W5CH,),
                      Text("${model.klinesCurrentissueno.issueNo}",style: styleF17W9CH,)
                    ],
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Phase",style: styleF17W5CH,),
                    Text("07261527",style: styleF17W9CH,)
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("binance_game_app_assets/images/clock.png",width: 33.w,height: 33.h,),
                  // SizedBox(width: 21.w),
                  Container(
                    child: Center(
                      child: Consumer<KlinesViewModel>(
                        builder: (_,model,child){
                          return StreamBuilder<int>(
                            initialData: 0,
                            stream: model.stream,
                            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                              int data = snapshot.data;
                              if(data < 0) {
                                data = 0;
                              }
                              int minute = data % 3600 ~/ 60;
                              int second = data % 60;
                              if (data <= 0) {
                                if(model != null) {
                                  klinesViewModel.history();
                                  model.currentIssueNo();
                                }
                              }
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedFlipCounter(
                                    value: snapshot.hasData ? minute : 0,
                                    wholeDigits: 2,
                                    textStyle: theme.accentTextTheme.headline4.copyWith(fontWeight: FontWeight.w900, fontSize: 23.sp, color: Colors.white),
                                  ),
                                  Text(
                                    ":",
                                    style: theme.accentTextTheme.headline4.copyWith(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 23.sp,
                                        color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  AnimatedFlipCounter(
                                    value: snapshot.hasData ? (second) : 0,
                                    wholeDigits: 2,
                                    textStyle: theme.accentTextTheme.headline4.copyWith(fontWeight: FontWeight.w900, fontSize: 23.sp, color: Colors.white),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedFlipCounter(
                              value: 0,
                              wholeDigits: 2,
                              textStyle: theme.accentTextTheme.headline4.copyWith(fontWeight: FontWeight.w900, fontSize: 23.sp, color: Colors.white),
                            ),
                            Text(
                              ":",
                              style: theme.accentTextTheme.headline4.copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 23.sp,
                                  color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            ),
                            AnimatedFlipCounter(
                              value: 0,
                              wholeDigits: 2,
                              textStyle: theme.accentTextTheme.headline4.copyWith(fontWeight: FontWeight.w900, fontSize: 23.sp, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                      color: ThemeColors.COLOR_08A067,
                    ),
                    width: 96.w,
                    height: 33.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
