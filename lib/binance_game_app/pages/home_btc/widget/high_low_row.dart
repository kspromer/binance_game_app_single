import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_bettype/btc_lucky_bettype_get_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_current_issue_data/btc_lucky_current_issue_data_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_container/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_kline_1m_card/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tuple/tuple.dart';

class HighLowRow extends StatefulWidget {


  const HighLowRow({Key key, this.callback}) : super(key: key);

  final Function callback;

  @override
  _HighLowRowState createState() => _HighLowRowState();
}

class _HighLowRowState extends State<HighLowRow> {

  int currentIndex;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Selector<BtcLuckyViewModel,Tuple2<BtcLuckyCurrentIssueDataModel,List<BtcLuckyBettypeGetModel>>>(
      selector: (BuildContext context,BtcLuckyViewModel model) {
        return Tuple2(model.btcLuckyCurrentIssueDataModel,model.btcLuckyBettypeGetModels);
      },
      builder: (BuildContext context,value, Widget child) {
        if(value.item1 == null) {
          return child;
        }
        //最高价widget
        Widget resultHigh = currentIndex == 0 ? BgContainer.kLine1mCardClick(
          child: BgKline1mCard.click(
            lotteryResults: "${Constant.enumTypeToStr[value.item1.hignPoint]}",
            title: "最高价",
            currency: "BTC/USDT",
            price: "${value.item1.hign}",
            betCount: "${value.item2[10].top}",
          ),
        ) : BgContainer.kLine1mCard(
          child: BgKline1mCard(
            lotteryResults: "${Constant.enumTypeToStr[value.item1.hignPoint]}",
            title: "最高价",
            currency: "BTC/USDT",
            price: "${value.item1.hign}",
            betCount: "${value.item2[10].top}",
          ),
        );

        if(value.item2[10].bet != null && value.item2[10].bet > 0) {
          resultHigh = Stack(
            clipBehavior: Clip.none,
            children: [
              resultHigh,
              Positioned(
                  top: -5.h,
                  right: -5.w,
                  child: Container(
                    padding: EdgeInsets.all(4.5.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeColors.COLOR_F86363,
                    ),
                    child: Text(
                      "${value.item2[10].bet}",
                      style: theme.accentTextTheme.subtitle1,
                    ),
                  ))
            ],
          );
        }


        Widget resultLow = currentIndex == 1 ? BgContainer.kLine1mCardClick(
          child: BgKline1mCard.click(
            lotteryResults: "${Constant.enumTypeToStr[value.item1.lowPoint]}",
            title: "最低价",
            currency: "BTC/USDT",
            price: "${value.item1.low}",
            betCount: "${value.item2[11].top}",
          ),
        ) : BgContainer.kLine1mCard(
          child: BgKline1mCard(
            lotteryResults: "${Constant.enumTypeToStr[value.item1.lowPoint]}",
            title: "最低价",
            currency: "BTC/USDT",
            price: "${value.item1.low}",
            betCount: "${value.item2[11].top}",
          ),
        );

        if(value.item2[11].bet != null && value.item2[11].bet > 0) {
          resultLow = Stack(
            clipBehavior: Clip.none,
            children: [
              resultLow,
              Positioned(
                  top: -5.h,
                  right: -5.w,
                  child: Container(
                    padding: EdgeInsets.all(4.5.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeColors.COLOR_F86363,
                    ),
                    child: Text(
                      "${value.item2[11].bet}",
                      style: theme.accentTextTheme.subtitle1,
                    ),
                  ))
            ],
          );
        }



        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            InkWell(
              onTap: (){
                setState(() {
                  if(currentIndex == 0) {
                    currentIndex = null;
                  }else {
                    currentIndex = 0;
                  }
                  if(widget.callback != null) {
                    widget.callback(currentIndex);
                  }
                });
              },
              child: resultHigh
            ),

            InkWell(
              onTap: (){
                setState(() {
                  if(currentIndex == 1) {
                    currentIndex = null;
                  }else {
                    currentIndex = 1;
                  }
                  if(widget.callback != null) {
                    widget.callback(currentIndex);
                  }
                });
              },
              child: resultLow
            )
          ],
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BgContainer.kLine1mCard(
            child: BgKline1mCard(
              lotteryResults: "",
              title: "最高价",
              currency: "BTC/USDT",
              price: "",
              betCount: "",
            ),
          ),
          BgContainer.kLine1mCard(
            child: BgKline1mCard(
              lotteryResults: "",
              title: "最低价",
              currency: "BTC/USDT",
              price: "",
              betCount: "",
            ),
          ),
        ],
      ),
    );
  }
}
