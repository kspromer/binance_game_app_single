import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "最高享",
          style: Theme.of(context)
              .accentTextTheme
              .subtitle1
              .copyWith(fontSize: 20.sp),
        ),
        SizedBox(width: 6.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: ThemeColors.COLOR_F0642C,
            borderRadius: BorderRadius.all(
              Radius.circular(5.r),
            ),
          ),
          child: Text(
            "40%交易返利",
            style: Theme.of(context)
                .accentTextTheme
                .subtitle1
                .copyWith(fontSize: 15.sp),
          ),
        ),
      ],
    );
  }
}
