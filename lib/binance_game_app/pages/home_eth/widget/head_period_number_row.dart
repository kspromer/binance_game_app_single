import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_current_issue_data/btc_lucky_current_issue_data_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/message/countdown_response.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/ws/handler/countdown_response_handler.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_container/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_kline_1m_card/index.dart';
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

    CountdownResponseHandler countdownResponseHandler = Provider.of<CountdownResponseHandler>(context,listen: false);

    var styleF17W5CH = theme.accentTextTheme.headline5;
    var styleF17W9CH = styleF17W5CH.copyWith(fontWeight: FontWeight.w900);

    return Row(
      children: [
        SizedBox(width: 15.w),
        BgContainer.kLine1mCard(
          child: Selector(
            builder: (BuildContext context,BtcLuckyCurrentIssueDataModel value, Widget child) {
              if(value == null) {
                return child;
              }
              return BgKline1mCard(
                lotteryResults: "${Constant.enumTypeToStr[value.closePoint]}",
                point: this.point,
                title: "收盘价",
                currency: "BTC/USDT",
                price: "${value.close}",
              );
            },
            selector: (BuildContext context, BtcLuckyViewModel model) {
              return model.btcLuckyCurrentIssueDataModel;
            },
            child: BgKline1mCard(
              lotteryResults: lotteryResults,
              point: this.point,
              title: "收盘价",
              currency: "BTC/USDT",
              price: "34393.65",
            ),
          ),
        ),
        SizedBox(width: 18.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            Selector(
              builder: (BuildContext context,BtcLuckyCurrentIssueDataModel value, Widget child) {
                if(value == null) {
                  return child;
                }
                return Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "BTC  ",style: styleF17W5CH),
                      TextSpan(text: "第 "),
                      TextSpan(text: " ${value.currentIssueNo} ", style: styleF17W9CH),
                      TextSpan(text: " 期"),
                    ],
                  ),
                  style: styleF17W5CH,
                );
              },
              selector: (BuildContext context, BtcLuckyViewModel model) {
                return model.btcLuckyCurrentIssueDataModel;
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "BTC",style: styleF17W5CH),
                    TextSpan(text: "第"),
                    TextSpan(text: " ... ", style: styleF17W9CH),
                    TextSpan(text: "期"),
                  ],
                ),
                style: styleF17W5CH,
              ),
            ),
            SizedBox(height: 11.h),
            Row(
              children: [
                Selector<CountdownResponseHandler,int>(

                  child: Text("加载中",style: styleF17W5CH.copyWith(fontWeight: FontWeight.w800),),
                  builder: (BuildContext context,int value, Widget child) {
                    switch(value) {
                      case 1:
                        return Text("开奖中",style: styleF17W5CH.copyWith(fontWeight: FontWeight.w800),);
                      case 2:
                        return Text("投注中",style: styleF17W5CH.copyWith(fontWeight: FontWeight.w800),);
                      case 3:
                        return Text("已截止",style: styleF17W5CH.copyWith(fontWeight: FontWeight.w800),);
                    }
                    return child;
                  },
                  selector: (BuildContext context,CountdownResponseHandler handler) {
                    return handler.lotteryType;
                  },
                ),
                SizedBox(width: 21.w),
                Text(
                  "倒计时 ",
                  style: theme.textTheme.headline5.copyWith(fontSize: 15.sp),
                ),
                Container(
                  child: Center(
                    child: StreamBuilder(
                      stream: countdownResponseHandler.streamController.stream,
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        return Text(
                          "${snapshot.hasData ? snapshot.data : 0}",
                          style: theme.accentTextTheme.headline4.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    color: ThemeColors.COLOR_747884,
                  ),
                  width: 30.w,
                  height: 25.h,
                ),
                Text(
                  " S",
                  style: theme.accentTextTheme.headline6,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
