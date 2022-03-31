import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_invite_rewards/home_assets_invite_rewards_mine_invite/widget/invite_count_tabbar_view.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_invite_rewards/home_assets_invite_rewards_mine_invite/widget/mine_rebate_tabbar_view.dart';
import 'package:binance_game_app_single/binance_game_app/widget/%20bg_tabs/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_container/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_home_assets_invite_rewards_mine_invite_tabbar/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';

class HomeAssetsInviteRewardsMineInvitePages extends StatelessWidget {
  static const routeName = '/homeAssetsInviteRewardsMineInvitePages';

  HomeAssetsInviteRewardsMineInvitePages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgContainer.inviteRewardsTopBgc(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Image.asset("binance_game_app_assets/images/back_icon.png",
                      width: 8.w, height: 13.h),
                ),

                74.0.sxh,

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.1],
                            colors: [Colors.transparent, Colors.white])),
                    child: Column(
                      children: [
                        //tabbar切换栏
                        BgHomeAssetsInviteRewardsMineInviteTabbar(),

                        ColoredBox(
                          child: SizedBox(width: double.infinity, height: 10.h),
                          color: ThemeColors.COLOR_F7F7F7,
                        ),

                        16.sxh,

                        Expanded(
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              InviteCountTabbarView(),
                              MineRebateTabbarView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
