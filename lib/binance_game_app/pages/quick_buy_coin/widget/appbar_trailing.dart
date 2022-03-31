import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarTrailing extends StatelessWidget {
  const AppbarTrailing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 25.w),
      child: Container(
        width: 110.w,
        height: 10.h,
        decoration: BoxDecoration(
          color: ThemeColors.COLOR_F7F7F7,
          borderRadius: BorderRadius.circular(12.5.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("CNY"),
            Image.asset(
              "binance_game_app_assets/images/quick_buy_coin_switch_icon.png",
              width: 11.w,
              height: 11.h,
            ),
            Image.asset(
              "binance_game_app_assets/images/quick_buy_coin_more_icon.png",
              width: 11.w,
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
