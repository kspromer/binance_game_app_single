import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/utils/bg_show_general_dialog.dart';
import 'package:binance_game_app_single/binance_game_app/utils/eg_show_modal_bottom_sheet.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';
import '../home_assets_invite_rewards_posters_share_pages.dart';
import '../home_assets_invite_rewards_update_ratio_pages.dart';

class TopCard extends StatelessWidget {
  final styleF20WHC1;

  final styleF20WHC2;

  const TopCard({Key key, this.styleF20WHC1, this.styleF20WHC2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> _row2s = [
      {"邀请码": "df4br6d84"},
      {"邀请链接": "www.huobi...df4br6d84"},
    ];
    //边角
    Decoration decoration = BoxDecoration(
      color: ThemeColors.COLOR_F9F7F3,
      borderRadius: BorderRadius.all(
        Radius.circular(7.r),
      ),
    );
    //第一行
    Widget row1 = Row(
      children: [
        Container(
          decoration: decoration,
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
          child: Text.rich(TextSpan(text: "我的返利", children: [
            TextSpan(text: " 30%", style: styleF20WHC1),
            TextSpan(text: "    好友返利"),
            TextSpan(text: " 0% ", style: styleF20WHC2),
          ])),
        ),
        13.sxw,
        InkWell(
          onTap: () {
            BgShowGeneralDialog.build(
                context: context,
                builder: HomeAssetsInviteRewardsUpdateRatioPages());
          },
          child: Image.asset(
            "binance_game_app_assets/images/edit_icon.png",
            width: 17.w,
            height: 16.5.h,
          ),
        ),
      ],
    );
    //第三行
    Widget row3 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "binance_game_app_assets/images/qr_code_icon.png",
          width: 40.w,
          height: 40.h,
        ),
        BgButtonBars.inviteRewardsBtn(
          padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 13.h),
          values: ["海报邀请"],
          callback: (index) {
            BgShowModalBottomSheet.build(
                context: context,
                builder: HomeAssetsInviteRewardsPostersSharePages());
          },
        )
      ],
    );
    //卡片返回
    return Card(
      child: Container(
        width: 335.w,
        height: 235.h,
        padding: EdgeInsets.symmetric(horizontal: 17.5.w, vertical: 22.h),
        child: Column(
          children: [
            row1,
            for (int i = 0; i < _row2s.length; i++)
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Row(
                  children: [
                    Text(
                      "${_row2s[i].keys.first}",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Spacer(),
                    Container(
                      decoration: decoration,
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.5.w, vertical: 5.h),
                      child: Text.rich(TextSpan(
                          text: "${_row2s[i].values.first}  ",
                          children: [
                            WidgetSpan(
                                child: Image.asset(
                              "binance_game_app_assets/images/copy_icon.png",
                              width: 14.w,
                              height: 15.h,
                            ))
                          ])),
                    ),
                  ],
                ),
              ),
            Spacer(),
            row3,
          ],
        ),
      ),
    );
  }
}
