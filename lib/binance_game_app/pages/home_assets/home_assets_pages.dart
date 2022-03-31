import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_alert/home_assets_alert_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/quick_buy_coin/quick_buy_coin_pages.dart';
import 'package:binance_game_app_single/binance_game_app/utils/bg_show_dialog.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/account/account_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/auth/auth_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/message/message_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/user/user_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_alert_dialog/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_circle_avatar/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_container/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_image_asset/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_list_tile/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:common_utils/common_utils.dart';

class HomeAssetsPages extends StatelessWidget {

  const HomeAssetsPages({Key key}) : super(key: key);

  PreferredSizeWidget appBar(BuildContext context) {
    return null;
  }

  static PreferredSizeWidget appBar1() {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Image.asset("binance_game_app_assets/images/home_assets_top_bgc.png",fit: BoxFit.cover,),

      actions: [
        Image.asset("binance_game_app_assets/images/home_assets_bell_icon.png"),
        SizedBox(width: 15.w,),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    //全局配置
    ThemeData theme = Theme.of(context);
    //获取顶部状态栏高度
    double top = MediaQuery.of(context).padding.top;
    return BgContainer.homeAssetsTopBgc(
      child: Column(
        children: [
          SizedBox(height: top,),
          //铃铛
          BgImageAsset.centerRight("binance_game_app_assets/images/home_assets_bell_icon.png"),
          //用户信息
          Consumer<AccountViewModel>(
            builder: (_,model,child){
              debugPrint("BgListTile.userInfo rebuild");
              if(model.model == null){
                return child;
              }
              return BgListTile.userInfo(
                title: "${model.model.username}",
                subTitle: "${TextUtil.hideNumber(model.model.username)}",
                leading: BgCircleAvatar.backgroundImage("https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL0ibQkwQ87uH2U8jjB96LBuB8eDKRgicMs372K318tTExz0awujhouVRRHA5Fy39hzyKPkgCZ2c4Cw/132",radius: 27.r,),
                trailing: BgImageAsset.cover("binance_game_app_assets/images/home_assets_more_icon.png", 9.w, 17.5.h),
              );
            },
            child: BgListTile.userInfo(
              title: "",
              subTitle: "",
              leading: BgCircleAvatar.backgroundImage("https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL0ibQkwQ87uH2U8jjB96LBuB8eDKRgicMs372K318tTExz0awujhouVRRHA5Fy39hzyKPkgCZ2c4Cw/132",radius: 27.r,),
              trailing: BgImageAsset.cover("binance_game_app_assets/images/home_assets_more_icon.png", 9.w, 17.5.h),
            ),
          ),

          SizedBox(height: 10.h,),
          BgContainer.homeAssetsBodyBgc(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(child: SizedBox(width: 24.w,),),
                      TextSpan(text: "总资产(USDT)"),
                      WidgetSpan(
                        child: SizedBox(width: 5.w,),
                      ),
                      WidgetSpan(
                        child: Image.asset("binance_game_app_assets/images/home_assets_eyes_icon.png",width: 12.w,height: 9.h,),
                        alignment: PlaceholderAlignment.middle,
                      ),
                    ]
                  ),
                  style: theme.textTheme.headline1.copyWith(color: Colors.white),
                ),
                SizedBox(height: 18.h,),
                Consumer<AccountViewModel>(
                  builder: (_,model,child){
                    if(model.model == null) {
                      return child;
                    }
                    return Text.rich(
                      TextSpan(
                          children: [
                            WidgetSpan(child: SizedBox(width: 24.w,),),
                            TextSpan(text: "${model.model.money.toDouble()}"),
                            TextSpan(text: "USDT  ≈ ￥${model.model.money.toDouble()}",style: theme.textTheme.headline1.copyWith(color: Colors.white)),
                          ]
                      ),
                      style: theme.appBarTheme.titleTextStyle.copyWith(color: Colors.white,height: 1),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                        children: [
                          WidgetSpan(child: SizedBox(width: 24.w,),),
                          TextSpan(text: "0.00"),
                          TextSpan(text: "USDT  ≈ ￥0.00",style: theme.textTheme.headline1.copyWith(color: Colors.white)),
                        ]
                    ),
                    style: theme.appBarTheme.titleTextStyle.copyWith(color: Colors.white,height: 1),
                  ),
                ),
                SizedBox(height: 10.h,),
                BgButtonBars.reverse2(
                  padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 8.h),
                  values: ["充值","提现","转账"],
                  callback: (i){
                    Navigator.of(context).pushNamed(Constant.homeAssetsBodyButtonUrls[i]);
                  },
                )
              ],
            ),
          ),


          SizedBox(height: 10.h,),
          InkWell(
            onTap: (){

              Navigator.of(context).pushNamed(QuickBuyCoinPages.routeName);

            },
            child: Container(
              width: 345.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Row(
                children: [
                  SizedBox(width: 25.w,),
                  Image.asset("binance_game_app_assets/images/home_assets_buy_coin_icon.png",width: 50.w,height: 45.5.h,),
                  SizedBox(width: 15.w,),
                  Text("快捷买币",style: theme.textTheme.headline3.copyWith(fontSize: 17.sp),),
                  Spacer(),
                  Image.asset("binance_game_app_assets/images/home_assets_big_more_icon.png",width: 40.w,height: 40.h,),
                  SizedBox(width: 20.w,),
                ],
              ),
            ),
          ),

          SizedBox(height: 10.h,),

          Container(
            width: 345.w,
            height: 300.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 13.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(11, (index) {
                  if(index % 2 == 0) {
                    index ~/= 2;
                    return InkWell(
                      onTap: (){
                        if(index == 3) {
                          BgShowDialog.build(builder: BgAlertDialog(success: (){
                            print("确认清空");
                          },),context: context);
                        }else {
                          Navigator.of(context).pushNamed(Constant.cardItemModels[index].routerName);
                        }
                      },
                      child: Row(
                        children: [
                          Image.asset("binance_game_app_assets/images/${Constant.cardItemModels[index].icon}",width: 22.w,height: 22.h,),
                          SizedBox(width: 8.5.w,),
                          Text("${Constant.cardItemModels[index].title}",style: theme.textTheme.subtitle2,),
                          Spacer(),
                          index == 3 ? Text("33.76M",style: theme.accentTextTheme.headline1,) : SizedBox.shrink(),
                          SizedBox(width: 9.w,),
                          Image.asset("binance_game_app_assets/images/home_assets_small_more_icon.png",width: 10.w,height: 10.h,),
                        ],
                      ),
                    );
                  }
                  return Divider();
                }).toList(),
            ),
          )


        ],
      ),
    );
  }
}
