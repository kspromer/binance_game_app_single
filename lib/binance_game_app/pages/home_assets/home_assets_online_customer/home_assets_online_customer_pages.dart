import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_online_customer/widget/appbar_bottom.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_online_customer/widget/body_left_button.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_online_customer/widget/body_left_link.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_online_customer/widget/body_right_msg.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';

class HomeAssetsOnlineCustomerPages extends StatelessWidget {
  static const routeName = '/homeAssetsOnlineCustomerPages';

  const HomeAssetsOnlineCustomerPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var headPortraitDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
            width: 1, color: ThemeColors.COLOR_ECECEC));

    var bodyConstraints = BoxConstraints.loose(Size(290.w, double.infinity));
    var bodyPadding = EdgeInsets.fromLTRB(10.w, 14.h, 10.w, 14.h);

    var bodyButtonPadding = EdgeInsets.symmetric(horizontal: 17.w,vertical: 9.h);
    var bodyButtonMargin = EdgeInsets.only(right: 10.w);

    var bodyDecoration = BoxDecoration(
        color: ThemeColors.COLOR_F9F7F3,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(width: 0.5,color: ThemeColors.COLOR_EED7B1)
    );
    var bodyButtonDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(width: 0.5,color: ThemeColors.COLOR_ECECEC)
    );

    var bodyMsgDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(width: 0.5,color: ThemeColors.COLOR_ECECEC)
    );

    var bodyStyle = Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 12.sp,height: 1.6);
    var bodyLinkStyle = Theme.of(context).accentTextTheme.bodyText1.copyWith(fontSize: 12.sp,height: 1.6);


    return Scaffold(
      appBar: AppBar(
        bottom: AppbarBottom(),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BodyLeftLink(decoration: headPortraitDecoration,bodyConstraints: bodyConstraints,bodyPadding: bodyPadding,bodyDecoration: bodyDecoration,bodyStyle: bodyStyle,bodyLinkStyle: bodyLinkStyle,),
                  25.sxh,
                  BodyRightMsg(bodyConstraints: bodyConstraints,decoration: headPortraitDecoration,bodyPadding: bodyPadding,bodyDecoration: bodyMsgDecoration,),
                  25.sxh,
                  BodyLeftButton(decoration: headPortraitDecoration,bodyConstraints: bodyConstraints,bodyPadding: bodyPadding,bodyDecoration: bodyDecoration,bodyStyle: bodyStyle,bodyButtonDecoration: bodyButtonDecoration,bodyButtonPadding: bodyButtonPadding,bodyButtonMargin: bodyButtonMargin,),
                  25.sxh,
                  BodyRightMsg(bodyConstraints: bodyConstraints,decoration: headPortraitDecoration,bodyPadding: bodyPadding,bodyDecoration: bodyMsgDecoration,),
                  25.sxh,
                  BodyLeftButton(decoration: headPortraitDecoration,bodyConstraints: bodyConstraints,bodyPadding: bodyPadding,bodyDecoration: bodyDecoration,bodyStyle: bodyStyle,bodyButtonDecoration: bodyButtonDecoration,bodyButtonPadding: bodyButtonPadding,bodyButtonMargin: bodyButtonMargin,),
                  25.sxh,
                  BodyRightMsg(bodyConstraints: bodyConstraints,decoration: headPortraitDecoration,bodyPadding: bodyPadding,bodyDecoration: bodyMsgDecoration,),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: -10.h,
            left: 0.h,
            child: SafeArea(
              child: Container(
                width: 375.w,
                height: 50.h,
                child: Row(
                  children: [
                    BgTextField(
                      prefixIcon: SizedBox(width: 36.w,),
                      hintText: "请输入您的问题",
                      width: 295.w,
                      height: 50.h,
                    ),
                    Container(
                      color: ThemeColors.COLOR_747884,
                      width: 80.w,
                      height: 50.h,
                      child: Icon(Icons.send,color: Colors.white,),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
