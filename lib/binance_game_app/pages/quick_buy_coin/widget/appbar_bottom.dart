import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_radio_group/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';

class AppbarBottom extends StatelessWidget implements PreferredSizeWidget{

  const AppbarBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.COLOR_F7F7F7,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Row(
        children: [
          SizedBox(
            width: 170.w,
            child: BgRadioGroup(
              initIndex: 0,
              width: 80.w,
              height: 25.h,
              values: ["我要买", "我要卖"],
            ),
          ),
          Spacer(),
          Image.asset(
            "binance_game_app_assets/images/quick_buy_coin_search1_icon.png",
            width: 14.w,
            height: 17.h,
          ),
          19.sxw,
          Image.asset(
            "binance_game_app_assets/images/quick_buy_coin_search2_icon.png",
            width: 16.w,
            height: 16.h,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(375.w, 40.h);
}
