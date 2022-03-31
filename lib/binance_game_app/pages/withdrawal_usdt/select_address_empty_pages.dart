import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SelectAddressEmptyPages extends StatelessWidget {

  const SelectAddressEmptyPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: 375.w,
      height: 350.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
      child: Column(
        children: [
          Text("选择地址",style: textTheme.headline4,),
          SizedBox(height: 49.5.h,),
          Image.asset("binance_game_app_assets/images/empty_icon.png",width: 58.5,height: 60.5,),
          SizedBox(height: 44.5.h,),
          Text("您还没有地址",style: textTheme.headline2.copyWith(fontWeight: FontWeight.bold),),
          SizedBox(height: 38.5.h,),
          BgButtonBars.clickable(
            padding: EdgeInsets.symmetric(horizontal:135.w,vertical: 14.h),
            values: ["使用新地址"],
          )
        ],
      ),
    );
  }
}
