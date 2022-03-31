import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgListTile extends StatelessWidget {

  const BgListTile({
    Key key,
    this.dense,
    this.contentPadding,
    this.leading,
    this.trailing,
    this.horizontalTitleGap,
    this.subtitle1,
    this.bodyText2,
    this.caption,
    @required this.title,
    @required this.subTitle,
  }) : super(key: key);

  final bool dense;

  final EdgeInsetsGeometry contentPadding;

  final String title;

  final String subTitle;

  final Widget leading;

  final Widget trailing;

  final double horizontalTitleGap;

  final TextStyle subtitle1;

  final TextStyle bodyText2;

  final TextStyle caption;


  BgListTile.chargeAddress({
    this.title,
    this.subTitle,
    this.leading,
    this.trailing
  }):this.dense = false,
        this.subtitle1 = TextStyle(fontSize: 13.sp, color: ThemeColors.COLOR_747884,fontWeight: FontWeight.w500),
        this.bodyText2 = TextStyle(fontSize: 13.sp, color: ThemeColors.COLOR_303030,fontWeight: FontWeight.w500),
        this.caption = TextStyle(fontSize: 13.sp, color: ThemeColors.COLOR_303030,fontWeight: FontWeight.w500),
        this.contentPadding = EdgeInsets.fromLTRB(36.w, 21.h, 50.w, 21.h),
        this.horizontalTitleGap = null;


  BgListTile.userInfo({
    this.title,
    this.subTitle,
    this.leading,
    this.trailing
  }):this.dense = true,
    this.subtitle1 = TextStyle(fontSize: 17.sp, color: Colors.white,fontWeight: FontWeight.w500,height: 1),
    this.bodyText2 = TextStyle(fontSize: 14.sp, color: Colors.white,fontWeight: FontWeight.w500,height: 1),
    this.caption = TextStyle(fontSize: 13.sp, color: Colors.white,fontWeight: FontWeight.w500,height: 1),
    this.contentPadding = EdgeInsets.symmetric(horizontal: 15.w),
    this.horizontalTitleGap = 19.5.w;


  @override
  Widget build(BuildContext context) {
    //全局配置
    ThemeData theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
            subtitle1: this.subtitle1,
            bodyText2: this.bodyText2,
            caption: this.caption,
          )
      ),
      child: ListTileTheme(
        horizontalTitleGap: this.horizontalTitleGap,
        contentPadding: this.contentPadding,
        dense: this.dense,
        child: ListTile(
          title: Text(this.title),
          subtitle: Text(this.subTitle),
          leading: this.leading,
          trailing: this.trailing,
        ),
      ),
    );
  }
}
