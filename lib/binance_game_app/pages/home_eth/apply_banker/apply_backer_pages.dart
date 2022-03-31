import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/dto/btc_lucky_banker_post/btc_lucky_banker_post_dto.dart';
import 'package:binance_game_app_single/binance_game_app/dto/eth_lucky_banker_post/eth_lucky_banker_post_dto.dart';
import 'package:binance_game_app_single/binance_game_app/model/bet_icon/bet_icon_model.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_btc/widget/default_bet_row.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/eth/eth_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/user/user_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class ApplyBackerPages extends StatelessWidget {

  ApplyBackerPages({Key key, this.bankerType}) : super(key: key);

  final String bankerType;
  //类型
  final TextEditingController moneyController = TextEditingController(text: "2000");

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final List<BetIconModel> _betList = [
      BetIconModel(selectUrl: '1_on',text: "1000",url: "1",style: theme.primaryTextTheme.headline2),
      BetIconModel(selectUrl: '10_on',text: "2000",url: "10",style: theme.primaryTextTheme.headline2.copyWith(color: ThemeColors.COLOR_738ADA)),
      BetIconModel(selectUrl: '50_on',text: "5000",url: "50",style: theme.primaryTextTheme.headline2.copyWith(color: ThemeColors.COLOR_E96277)),
      BetIconModel(selectUrl: '100_on',text: "10000",url: "100",style: theme.primaryTextTheme.headline2.copyWith(color: ThemeColors.COLOR_38B277)),
    ];
    return SizedBox(
      width: 310.w,
      height: 275.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.5.w,vertical: 20.h),
        child: Column(
          children: [
            Text("请输入上庄金额(USDT)：",style: Theme.of(context).accentTextTheme.bodyText1.copyWith(color: Colors.black),),
            15.5.sxh,
            BgTextField(
              width: 240.w,
              height: 30.h,
              controller: moneyController,
              prefixIconConstraints: BoxConstraints.loose(Size(14.5.w,0.h)),
              prefixIcon: SizedBox(width: 14.5.w,),
              suffixIcons: [
                Text("USDT",style: Theme.of(context).textTheme.bodyText2.copyWith(color: ThemeColors.COLOR_CCCCCC),),
                Text("最大"),
              ],
              hintText: "2000",
            ),
            18.sxh,
            DefaultBetRow(betList: _betList,callback: (BetIconModel model){
              moneyController.text = model.text;
            },),
            11.sxh,
            Row(
              children: [
                Text("最大可上庄：",style: Theme.of(context).textTheme.headline1,),
                Spacer(),
                Consumer<UserViewModel>(
                  builder: (_,model,child){
                    if(model.userModel == null) {
                      return child;
                    }
                    return Text("${model.userModel.money.toDouble()}",style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),);
                  },
                  child: Text("0.00",style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),),
                ),
                Text("USDT",style: Theme.of(context).textTheme.headline1,),
              ],
            ),
            8.sxh,
            Row(
              children: [
                Text("最低上庄要求：",style: Theme.of(context).textTheme.headline1,),
                Spacer(),
                Text("1000.00",style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),),
                Text("USDT",style: Theme.of(context).textTheme.headline1,),
              ],
            ),
            18.sxh,
            BgButtonBars.colorG(
              padding: EdgeInsets.symmetric(horizontal: 74.w,vertical: 10.h),
              values: ["申请上庄"],
              callback: (index){
                EthLuckyViewModel ethLuckyViewModel = Provider.of<EthLuckyViewModel>(context,listen: false);
                //用户
                UserViewModel userViewModel = Provider.of<UserViewModel>(context,listen: false);
                EthLuckyBankerPostDto dto = EthLuckyBankerPostDto();

                dto.money = moneyController.text;
                dto.bankerType = bankerType;

                ethLuckyViewModel.ethLuckyBankerPost(dto,success: (data) {
                  ethLuckyViewModel.ethLuckyBanker(success: (data) {
                    userViewModel.user(success: (data){
                      EasyLoading.showToast("上庄成功");
                      Navigator.of(context).pop();
                    });
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
