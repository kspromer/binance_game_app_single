import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ConfirmTransferUsdtOrderPages extends StatelessWidget {

  ConfirmTransferUsdtOrderPages({Key key}) : super(key: key);

  final List<Map> _list = [
    {"收款人":"18072231189"},
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 300.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                Image.asset("binance_game_app_assets/images/close_icon.png",width: 23.w,height: 23.h,),
              ],
            ),
            SizedBox(height: 14.5.h,),
            Text("33.84 USDT",style: AppBarTheme.of(context).titleTextStyle.copyWith(fontSize: 24.sp),),
            SizedBox(height: 70.5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (Map value in _list)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${value.keys.first}",style: textTheme.headline2.copyWith(fontWeight: FontWeight.bold),), Text("${value.values.first}",style: textTheme.bodyText2,),],
                    ),
                ],
              ),
            ),
            SizedBox(height: 37.5.h,),
            BgButtonBars.clickable(
              padding: EdgeInsets.symmetric(horizontal: 140.w,vertical: 15.h),
              values: ["确认转账"],
            )
          ],
        ),
      ),
    );
  }
}
