import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgContainer extends StatelessWidget {
  const BgContainer({
    Key key,
    this.padding,
    this.margin,
    this.color,
    this.url,
    this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.boxShadow,
  }) : super(key: key);

  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry margin;

  final Color color;

  final String url;

  final Widget child;

  final double width;

  final double height;

  final BorderRadiusGeometry borderRadius;

  final List<BoxShadow> boxShadow;

  BgContainer.inviteRewardsTopBgc({
    this.margin,
    this.child,
    this.height,
    this.borderRadius,
    this.boxShadow,
  })  : this.width = 375.w,
        this.padding = EdgeInsets.symmetric(horizontal: 20.w),
        this.color = ThemeColors.COLOR_F7F7F7,
        this.url =
            "binance_game_app_assets/images/home_assets_invite_rewards_bgc.png";

  BgContainer.homeAssetsTopBgc({this.child})
      : this.padding = EdgeInsets.symmetric(horizontal: 15.w),
        this.margin = null,
        this.color = ThemeColors.COLOR_F7F7F7,
        this.width = null,
        this.height = null,
        this.borderRadius = null,
        this.boxShadow = null,
        this.url = "binance_game_app_assets/images/home_assets_top_bgc.png";

  BgContainer.homeAssetsBodyBgc({
    this.child,
  })  : this.padding = null,
        this.margin = null,
        this.color = null,
        this.borderRadius = null,
        this.width = 325.w,
        this.height = 150.h,
        this.boxShadow = null,
        this.url = "binance_game_app_assets/images/home_assets_body_bgc.png";

  BgContainer.homeBetRecord({
    this.child,
  })  : this.margin = EdgeInsets.only(bottom: 10.h),
        this.padding = EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 12.h),
        this.color = Colors.white,
        this.url = null,
        this.width = null,
        this.height = null,
        this.boxShadow = null,
        this.borderRadius = BorderRadius.all(Radius.circular(10.r));

  BgContainer.kLine1mCard({
    this.child,
  })  : this.margin = null,
        this.color = null,
        this.padding = null,
        this.url =
            "binance_game_app_assets/images/home_lottery_results_bgc.png",
        this.width = 168.w,
        this.height = 67.5.h,
        this.boxShadow = [
          BoxShadow(
            offset: Offset(3.w, 8.h),
            blurRadius: 8.r, //阴影范围
            spreadRadius: 0.3, //阴影浓度
            color: Colors.black.withOpacity(0.3), //阴影颜色
          )
        ],
        this.borderRadius = BorderRadius.all(Radius.circular(10.r));

  BgContainer.kLine1mCardClick({
    this.child,
  })  : this.margin = null,
        this.color = ThemeColors.COLOR_F7F7F7,
        this.padding = null,
        this.url = null,
        this.width = 168.w,
        this.height = 67.5.h,
        this.boxShadow = [
          BoxShadow(
            offset: Offset(3.w, 8.h),
            blurRadius: 8.r, //阴影范围
            spreadRadius: 0.3, //阴影浓度
            color: Colors.black.withOpacity(0.3), //阴影颜色
          )
        ],
        this.borderRadius = BorderRadius.all(Radius.circular(10.r));

  @override
  Widget build(BuildContext context) {
    debugPrint("BgContainer.kLine1mCard print");
    DecorationImage image;
    if (url != null) {
      image = DecorationImage(
        image: AssetImage(this.url),
        fit: BoxFit.contain,
        alignment: Alignment.topCenter,
      );
    }
    return Container(
      width: this.width,
      height: this.height,
      padding: this.padding,
      margin: this.margin,
      decoration: BoxDecoration(
        color: this.color,
        image: image,
        boxShadow: this.boxShadow,
        borderRadius: this.borderRadius,
      ),
      child: this.child,
    );
  }
}
