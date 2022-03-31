import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_drop_up_text/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgKline1mCard extends StatelessWidget {

  final String title;

  final String currency;

  final String price;

  final String betCount;

  final int point;

  final String lotteryResults;

  final Color textColor;

  const BgKline1mCard({Key key, this.title, this.currency, this.price,this.betCount, this.point, this.lotteryResults, this.textColor}) : super(key: key);

  BgKline1mCard.click({Key key, this.title, this.currency, this.price,this.betCount, this.point, this.lotteryResults})
      : this.textColor = ThemeColors.COLOR_747884,super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final textLetColor = textColor ?? ThemeColors.COLOR_EED7B1;
    Widget result = Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                    text: "${title}",
                    // children: [
                    //   TextSpan(text: "  ${currency}",style: theme.textTheme.headline2.copyWith(color: textLetColor),),
                    // ]
                ),
                style: theme.textTheme.headline3.copyWith(color: textLetColor,),
              ),

              2 == point ? BgDropUpText.point2("${price}",textLetColor) : BgDropUpText.point5("${price}",textLetColor),

            ],
          ),
          // SizedBox(child: VerticalDivider(color: textLetColor,),height: 30.h,),
          Text(" ${this.lotteryResults ?? '牛六'}",style: theme.accentTextTheme.headline3.copyWith(color: textLetColor,fontSize: 10.sp),)
        ],
      ),
    );

    if(betCount != null) {
      result = Stack(
        children: [
          result,
          Positioned(
            bottom: 10.h,
            right: 10.w,
            child: Text("${this.betCount}",style: theme.textTheme.headline6,)
          )
        ],
      );
    }
    return result;
  }
}
