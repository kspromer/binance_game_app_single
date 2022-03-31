import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/dto/btc_lucky_banker_post/btc_lucky_banker_post_dto.dart';
import 'package:binance_game_app_single/binance_game_app/model/bet_icon/bet_icon_model.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/default_bet_row.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/user/user_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class ApplyBackerPages extends StatelessWidget {

  ApplyBackerPages({Key key, this.bankerType,this.callback}) : super(key: key);

  final String bankerType;
  final Function callback;
  //类型
  final TextEditingController moneyController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final List<BetIconModel> _betList = [
      BetIconModel(selectUrl: '1_on',text: "1",url: "1",style: theme.primaryTextTheme.headline2),
      BetIconModel(selectUrl: '10_on',text: "10",url: "10",style: theme.primaryTextTheme.headline2.copyWith(color: ThemeColors.COLOR_738ADA)),
      BetIconModel(selectUrl: '50_on',text: "50",url: "50",style: theme.primaryTextTheme.headline2.copyWith(color: ThemeColors.COLOR_E96277)),
      BetIconModel(selectUrl: '100_on',text: "100",url: "100",style: theme.primaryTextTheme.headline2.copyWith(color: ThemeColors.COLOR_38B277)),
    ];
    return SizedBox(
      width: 315.w,
      height: 250.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.5.w,vertical: 24.h),
        child: Column(
          children: [
            Text("Transaction amount",style: Theme.of(context).accentTextTheme.bodyText1.copyWith(color: ThemeColors.COLOR_303030),),
            20.sxh,
            BgTextField(
              width: 270.w,
              height: 40.h,
              controller: moneyController,
              prefixIconConstraints: BoxConstraints.loose(Size(14.5.w,0.h)),
              prefixIcon: SizedBox(width: 14.5.w,),
              hintText: "Enter the amount",
            ),
            15.5.sxh,
            DefaultBetRow(betList: _betList,callback: (BetIconModel model){
              moneyController.text = model.text;
            },),
            18.sxh,
            BgButtonBars.reverseGR(
              padding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 0.h),
              values: ["Cancel","OK"],
              callback: (index){
                if(index == 0) {
                  Navigator.of(context).pop();
                }else {
                  callback(moneyController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
