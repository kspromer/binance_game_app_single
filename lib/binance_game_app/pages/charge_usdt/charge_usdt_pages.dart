import 'dart:convert';
import 'dart:typed_data';

import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/widget/%20bg_tabs/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_list_tile/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/string_extension_lib.dart';


class ChargeUsdtPages extends StatelessWidget {

  static const routeName = '/chargeUsdtPages';

  ChargeUsdtPages({Key key}) : super(key: key);




  Uint8List base64Uint = base64.decode("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");

  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Constant.tabValues.length,
      child: Scaffold(
        appBar: "充值 USDT".appbar,
        body:DefaultTextStyle(
          style: Theme.of(context).textTheme.headline1,
          child: Column(
            children: [
              SizedBox(height: 30.h,),
              Container(
                height: 25.h,
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                child: BgTabs.defaultTabs(),
              ),
              Expanded(
                child: TabBarView(
                  physics: new NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 40.h,),
                          Image.memory(base64Uint,
                            width: 153.w,
                            height: 153.h,
                          ),
                          SizedBox(height: 25.h,),
                          //钱包地址
                          Container(
                            color: ThemeColors.COLOR_F7F7F7,
                            child: BgListTile.chargeAddress(
                              title: "钱包地址",
                              subTitle: "x3f1vbxfdbdxfsfbf3b51dgb62sf62vedfsbgfg1b6srb",
                              trailing: Image.asset("binance_game_app_assets/images/copy_icon.png",width: 15.w,height: 15.h,),
                            ),
                          ),
                          SizedBox(height: 22.h,),
                          Container(
                            padding: EdgeInsets.fromLTRB(15.w, 0, 18.5.w, 0),
                            width: 375.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("注意"),
                                SizedBox(height: 8.h,),
                                Text("*此地址只可接收USDT\n"
                                  "*请不要向这个地址充值除USDT之外的资产，任何充入此地址的其他资产将不可找回\n"
                                  "*充值后右上角联系客服上账。",style: Theme.of(context).textTheme.headline2.copyWith(height: 1.5),)
                              ],
                            ),
                          ),
                          SizedBox(height: 80.h,),
                          BgButtonBars.reverse(
                            callback: (index) {
                              print(index);
                            },
                            values: ["保存图片", "分享地址",],
                          ),
                        ],
                      ),
                    ),
                    Text("2"),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
