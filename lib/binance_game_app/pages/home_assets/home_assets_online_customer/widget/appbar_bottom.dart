import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';

class AppbarBottom extends StatelessWidget implements PreferredSizeWidget{
  const AppbarBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   var subtitle2 =  Theme.of(context)
        .accentTextTheme
        .subtitle2;
   var styleF15 = subtitle2.copyWith(fontSize: 15.sp);

   var styleF13 = subtitle2.copyWith(fontSize: 13.sp);
    return Container(
      width: 375.w,
      height: 80.h,
      color: ThemeColors.COLOR_747884,
      child: Column(
        children: [
          24.5.sxh,
          Text(
            "币全客服",
            style: styleF15,
          ),
          7.5.sxh,
          Text(
            "Case ID #84254554",
            style: styleF13,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(375.w, 80.h);
}
