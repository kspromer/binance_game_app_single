import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_invite_rewards/home_assets_invite_rewards_mine_invite/home_assets_invite_rewards_mine_invite_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomCard extends StatelessWidget {
  final inviteRewardsCard2Models;

  const BottomCard({Key key, this.inviteRewardsCard2Models}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget row1 = Row(
      children: [
        Text(
          "我的邀请",
          style: Theme.of(context).textTheme.headline4,
        ),
        Spacer(),
        Image.asset(
          "binance_game_app_assets/images/home_assets_invite_rewards_more_icon.png",
          width: 7.w,
          height: 10.h,
        ),
      ],
    );

    List<Widget> row2s =
        List.generate(inviteRewardsCard2Models.length, (index) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${inviteRewardsCard2Models[index].value}",
              style: inviteRewardsCard2Models[index].style,
            ),
            Text.rich(TextSpan(children: [
              WidgetSpan(
                  child: Image.asset(
                "${inviteRewardsCard2Models[index].icon}",
                width: 10.w,
                height: 10.h,
              )),
              TextSpan(
                  text: "  ${inviteRewardsCard2Models[index].title}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 10.sp)),
            ]),)
          ],
        ),
      );
    }).toList();

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HomeAssetsInviteRewardsMineInvitePages.routeName);
      },
      child: Card(
        child: Container(
          width: 335.w,
          height: 125.h,
          padding: EdgeInsets.symmetric(horizontal: 17.5.w, vertical: 14.5.h),
          child: Column(
            children: [
              row1,
              Spacer(),
              Container(
                width: 300.w,
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: ThemeColors.COLOR_F9F7F3,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                child: Row(
                  children: row2s,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
