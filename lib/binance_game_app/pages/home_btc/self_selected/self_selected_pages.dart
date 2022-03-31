import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/model/bet_icon/bet_icon_model.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/default_bet_row.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';
class SelfSelectedPages extends StatelessWidget {

  SelfSelectedPages({Key key, this.callback, this.niuAmount}) : super(key: key);

  final TextEditingController niuAmountController = TextEditingController();

  final Function callback;

  final int niuAmount;

  @override
  Widget build(BuildContext context) {
    if(niuAmount != null) {
      niuAmountController.text = niuAmount.toString();
    }
    ThemeData theme = Theme.of(context);
    final List<BetIconModel> _betList = [
      BetIconModel(selectUrl: '1_on',text: "1000",url: "1",style: theme.primaryTextTheme.headline2),
      BetIconModel(selectUrl: '10_on',text: "2000",url: "10",style: theme.primaryTextTheme.headline2.copyWith(color: ThemeColors.COLOR_738ADA)),
      BetIconModel(selectUrl: '50_on',text: "5000",url: "50",style: theme.primaryTextTheme.headline2.copyWith(color: ThemeColors.COLOR_E96277)),
      BetIconModel(selectUrl: '100_on',text: "10000",url: "100",style: theme.primaryTextTheme.headline2.copyWith(color: ThemeColors.COLOR_38B277)),
    ];
    return SizedBox(
      width: 310.w,
      height: 240.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.5.w,vertical: 20.h),
        child: Column(
          children: [
            Text("请输入上庄金额(USDT)：",style: Theme.of(context).accentTextTheme.bodyText1.copyWith(color: Colors.black),),
            15.5.sxh,
            BgTextField(
              controller: niuAmountController,
              width: 240.w,
              height: 30.h,
              keyboardType: TextInputType.number,
              prefixIconConstraints: BoxConstraints.loose(Size(14.5.w,0.h)),
              prefixIcon: SizedBox(width: 14.5.w,),
              suffixIcons: [
                Text("USDT",style: Theme.of(context).textTheme.bodyText2.copyWith(color: ThemeColors.COLOR_CCCCCC),),
              ],
              hintText: "2000",
            ),
            18.sxh,
            DefaultBetRow(betList: _betList,callback: (BetIconModel model){
              niuAmountController.text = model.text;
            },),
            18.sxh,
            BgButtonBars.colorG(
              padding: EdgeInsets.symmetric(horizontal: 74.w,vertical: 10.h),
              values: ["确认金额"],
              callback: (index){
                callback(niuAmountController.text);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
