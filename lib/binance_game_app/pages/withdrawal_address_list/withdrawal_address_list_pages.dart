import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/string_extension_lib.dart';

class WithdrawalAddressListPages extends StatelessWidget {

  static const routeName = '/withdrawalAddressListPages';

  const WithdrawalAddressListPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: "提现地址".appbar,
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80.h,width: 345.w,),
              Image.asset("binance_game_app_assets/images/empty_icon.png",width: 58.5,height: 60.5,),
              SizedBox(height: 50.h,),
              Text("没有搜索结果"),
              SizedBox(height: 350.h,),
              BgButtonBars.clickable(
                padding: EdgeInsets.symmetric(horizontal: 135.w,vertical: 14.h),
                values: ["添加新地址"],
              )
            ],
          ),
        ),
      ),
    );
  }
}
