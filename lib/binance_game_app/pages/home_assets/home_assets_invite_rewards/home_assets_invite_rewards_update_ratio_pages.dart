import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_radio_group/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAssetsInviteRewardsUpdateRatioPages extends StatelessWidget {

  HomeAssetsInviteRewardsUpdateRatioPages({Key key}) : super(key: key);

  final TextEditingController controller = TextEditingController(text: "10");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w,
      height: 260.h,
      child: Padding(
        padding: EdgeInsets.fromLTRB(22.5.w, 20.h, 22.5.h, 27.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(child: Text("修改返利比例",style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 20.sp)),alignment: Alignment.centerLeft,),

            BgTextField(
              width: 270.w,
              height: 40.h,
              controller: controller,
              textAlign: TextAlign.right,
              style: Theme.of(context).accentTextTheme.bodyText2,
              prefixIconConstraints: BoxConstraints.expand(width: 100.w,height: 40.h),
              prefixIcon: SizedBox(child: Align(alignment: Alignment.centerRight,child: Text("好友返利比例：",style: Theme.of(context).textTheme.bodyText2,)),width: 100.w,),
              suffixOverlay: SizedBox(width: 140.w,child: Align(alignment: Alignment.centerLeft,child: Text("%",style: Theme.of(context).accentTextTheme.bodyText2,))),
            ),

            BgRadioGroup.inviteRewardsUpdateRatioDialogBtns(
              initIndex: 0,
              values: ["0%","10%","20%","40%"],
              callback: (index){
                print(index);
              },
            ),

            Text("好友返利比例：",style: Theme.of(context).textTheme.headline4,),

            Text("当前您最多可分配返利30%",style: Theme.of(context).textTheme.headline2,),
            BgButtonBars.reverse(
              padding: EdgeInsets.symmetric(horizontal: 48.w,vertical: 12.5.h),
              values: ["取消","确认"],
              callback: (index){
                if(index == 0) {
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
