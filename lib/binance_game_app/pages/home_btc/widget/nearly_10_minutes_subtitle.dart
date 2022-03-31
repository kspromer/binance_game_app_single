import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';

class Nearly10MinutesSubtitle extends StatelessWidget {
  const Nearly10MinutesSubtitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("Nearly10MinutesSubtitle rebuild");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        children: [
          Container(
            width: 3.w,
            height: 11.h,
            color: ThemeColors.COLOR_E4C592,
          ),
          10.sxw,
          Text("近10分钟开奖结果", style: Theme.of(context).textTheme.headline5,)
        ],
      ),
    );
  }
}
