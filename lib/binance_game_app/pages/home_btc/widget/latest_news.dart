import 'dart:ui';

import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    debugPrint("LatestNews rebuild");
    return Row(
      children: [
        SizedBox(child: VerticalDivider(color: ThemeColors.COLOR_E4C592,width: 10,thickness: 3,),height: 11.h,),
        SizedBox(width: 11.w,),
        Text(this.title,style: theme.textTheme.headline1.copyWith(height: 1.2,fontSize: 16.sp,fontWeight: FontWeight.w800),),
      ],
    );
  }
}
