import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/account/account_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/user/user_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_radio_group/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BgHomeAppBar {



  final PreferredSizeWidget bottom;

  final double usdt;


  BgHomeAppBar({
    this.bottom,
    this.usdt,
  });

  PreferredSizeWidget build(BuildContext context) {
    print("build app BAr");
    ThemeData theme = Theme.of(context);
    return AppBar(
      centerTitle: false,
      leadingWidth: 40.w,
      titleSpacing: 0.w,
      leading: Image.asset("binance_game_app_assets/images/home_user_assest_icon.png",width: 19.w,height: 18.h,),
      // title: Text("账户资产：2615.27USDT"),
      title: Consumer<AccountViewModel>(
        builder: (_,model,child ){
          if(model.model == null){
            return child;
          }
          return Text.rich(
            TextSpan(
                text: "Assets：",
                children: [
                  TextSpan(text: "${model.model.money}",style: theme.textTheme.headline3.copyWith(fontSize: 17.sp)),
                  TextSpan(text: "USDT"),
                ]
            ),
            style: theme.textTheme.headline1.copyWith(height: 1.5),
          );
        },
        child: Text.rich(
          TextSpan(
              text: "账户资产：",
              children: [
                TextSpan(text: "0.00",style: theme.textTheme.headline3.copyWith(fontSize: 17.sp)),
                TextSpan(text: "USDT"),
              ]
          ),
          style: theme.textTheme.headline1.copyWith(height: 1.5),
        ),
      ),
      bottom: this.bottom,
    );
  }

}

