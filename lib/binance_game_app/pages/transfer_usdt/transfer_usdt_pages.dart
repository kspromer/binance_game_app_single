import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/utils/eg_show_modal_bottom_sheet.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/string_extension_lib.dart';
import 'confirm_transfer_usdt_order_pages.dart';

class TransferUsdtPages extends StatelessWidget {

  static const routeName = '/transferUsdtPages';

  const TransferUsdtPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //关闭键盘
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: "转账".appbar,
        body: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("手机号"),
                SizedBox(height: 10.h,),
                BgTextField.emptySuffixIcons(
                  hintText: "输入手机号",
                ),
                SizedBox(height: 26.h,),
                Text("金额"),
                SizedBox(height: 10.h,),
                BgTextField(
                  suffixIcons: [
                    Text("USDT",style: Theme.of(context).inputDecorationTheme.hintStyle),
                    Text("最大",style: Theme.of(context).textTheme.headline1.copyWith(color: ThemeColors.COLOR_E8B663),),
                  ],
                ),
                SizedBox(height: 10.5.h,),
                SizedBox(
                  width: 345.w,
                  child: Text.rich(TextSpan(
                    text: "最大可转 ",
                    children: [
                      TextSpan(text: "33.84 USDT",style: Theme.of(context).textTheme.headline3),
                    ],
                  ),style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.end,),
                ),
                SizedBox(height: 20.h,),
                Text("转账备注（选填）"),
                SizedBox(height: 10.h,),
                BgTextField.emptySuffixIcons(
                  hintText: "输入转账备注（对方可见）",
                ),
                SizedBox(height: 280.h,),
                BgButtonBars.notClickable(
                  padding: EdgeInsets.symmetric(horizontal: 157.w,vertical: 13.h),
                  values: ["确认"],
                  callback: (int) {
                    BgShowModalBottomSheet.build(context: context,builder: ConfirmTransferUsdtOrderPages());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
