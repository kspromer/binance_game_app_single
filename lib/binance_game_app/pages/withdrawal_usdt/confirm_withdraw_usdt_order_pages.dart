import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmWithdrawUsdtOrderPages extends StatelessWidget {

  ConfirmWithdrawUsdtOrderPages({Key key}) : super(key: key);

  List<Map> _list = [
    {"提币地址":"x3f1vbxfdbdxfsfbf3b51dgb62sf62vedfs"},
    {"主网络":"TRC20"},
    {"币种":"USDT"},
    {"金额":"20 USDT"},
    {"提币手续费":"1 USDT"},
  ];


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
      child: Column(
        children: [
          Text("确认订单",style: textTheme.headline4,),
          SizedBox(height: 24.h,),
          Text("实际到账：",style: textTheme.headline3,),
          SizedBox(height: 24.h,),
          Text.rich(TextSpan(
            text: "19",
            children: [
              TextSpan(
                text: " USDT",
                style: textTheme.headline4.copyWith(fontWeight: FontWeight.w500)
              )
            ]
          ),style: textTheme.headline4.copyWith(fontSize: 24.sp),),

          SizedBox(height: 28.h,),

          Container(
            color: ThemeColors.COLOR_F7F7F7,
            height: 190.h,
            width: 390.w,
            padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (Map value in _list)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${value.keys.first}",style: textTheme.headline2.copyWith(fontWeight: FontWeight.bold),),
                    Text("${value.values.first}",style: textTheme.bodyText2,),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          BgButtonBars.clickable(
            padding: EdgeInsets.symmetric(horizontal:156.w,vertical: 15.h),
            values: ["确认"],
            callback: (index) {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
