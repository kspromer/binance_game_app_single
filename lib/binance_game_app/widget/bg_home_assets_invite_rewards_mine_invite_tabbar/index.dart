import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/widget/%20bg_tabs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgHomeAssetsInviteRewardsMineInviteTabbar extends StatelessWidget {

  final ValueNotifier<int> _tabBarNotifier;
  final List<String> _value = ["邀请人数", "我的返利"];

  BgHomeAssetsInviteRewardsMineInviteTabbar({Key key,}) :this._tabBarNotifier = ValueNotifier(0), super(key: key);


  @override
  Widget build(BuildContext context) {
    TextStyle styleF15WMCH = Theme.of(context).textTheme.headline4;
    TextStyle styleF20WHCH1 = Theme.of(context).accentTextTheme.bodyText2;
    TextStyle styleF20WHCH2 = styleF20WHCH1.copyWith(color: ThemeColors.COLOR_303030);
    return ValueListenableBuilder(
      valueListenable: _tabBarNotifier,
      builder: (BuildContext context, int value, Widget child) {
        return Stack(
          children: [
            Container(
              height: 100.h,
              width: 335.w,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 15.h),
              foregroundDecoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(
                      "binance_game_app_assets/images/${value == 0 ? 'bezier_left_bgc.png' : 'bezier_right_bgc.png'}"),
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              child: BgTabs(
                height: 40.h,
                unselectedLabelColor: Colors.white,
                selectedColor: ThemeColors.COLOR_E8B663,
                unselectedColor: ThemeColors.COLOR_E8B663,
                values: _value,
                initIndex: _tabBarNotifier.value,
                borderRadius: value == 0 ? BorderRadius.only(topRight: Radius.circular(10.r)) : BorderRadius.only(topLeft: Radius.circular(10.r)),
                callback: (index){
                  _tabBarNotifier.value = index;
                },
              ),
            ),
            Positioned(
              top: 22.h,
              right: value == 1 ? 55.w : null,
              left: value == 0 ? 55.w : null,
              child: Text("${_value[value]}",style: styleF15WMCH,),
            ),
            Positioned(
              top: 69.h,
              left: 20.w,
              child: Text("738.35 U",style: value == 0 ? styleF20WHCH2 : styleF20WHCH1,),
            ),
          ],
        );
      },
    );
  }
}
