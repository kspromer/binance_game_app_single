import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_invite_rewards/widget/bottom_card.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_invite_rewards/widget/latest_news.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_invite_rewards/widget/sub_title.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_invite_rewards/widget/top_card.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_container/index.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeAssetsInviteRewardsPages extends StatelessWidget {
  static const routeName = '/homeAssetsInviteRewardsPages';

  HomeAssetsInviteRewardsPages({Key key}) : super(key: key);

  final int group = 1;

  @override
  Widget build(BuildContext context) {
    var styleF20WHC2 = Theme.of(context)
        .accentTextTheme
        .headline2
        .copyWith(fontSize: 20.sp, height: 1);
    var styleF20WHC1 = styleF20WHC2.copyWith(color: ThemeColors.COLOR_E8B663);
    Constant.inviteRewardsCard2Models[0].style = styleF20WHC2;
    Constant.inviteRewardsCard2Models[1].style = styleF20WHC1;
    return BgContainer.inviteRewardsTopBgc(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //返回
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Image.asset("binance_game_app_assets/images/back_icon.png",
                    width: 8.w, height: 13.h),
              ),
              20.sxh,
              //最新消息
              LatestNews(),
              15.sxh,
              Text("邀请好友一起交易",
                  style: Theme.of(context)
                      .accentTextTheme
                      .subtitle1
                      .copyWith(fontSize: 33.sp)),
              15.sxh,
              //副标题
              SubTitle(),
              15.sxh,
              //上面的card
              TopCard(
                styleF20WHC1: styleF20WHC1,
                styleF20WHC2: styleF20WHC2,
              ),
              //下面的card
              BottomCard(
                inviteRewardsCard2Models: Constant.inviteRewardsCard2Models,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
