import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/pages/withdrawal_usdt/confirm_withdraw_usdt_order_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/withdrawal_usdt/select_address_empty_pages.dart';
import 'package:binance_game_app_single/binance_game_app/utils/eg_show_modal_bottom_sheet.dart';
import 'package:binance_game_app_single/binance_game_app/widget/%20bg_tabs/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/string_extension_lib.dart';

class WithdrawalUsdtPages extends StatelessWidget {

  static const routeName = '/withdrawalUsdtPages';

  WithdrawalUsdtPages({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //关闭键盘
        FocusScope.of(context).unfocus();
      },
      child: DefaultTabController(
        length: Constant.tabValues.length,
        child: Scaffold(
          appBar: "提现 USDT".appbar,
          body: DefaultTextStyle(
            style: Theme.of(context).textTheme.headline1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("地址"),
                  SizedBox(height: 10.h,),
                  BgTextField(
                    hintText: "长按粘贴",
                    suffixIcons: [
                      InkWell(
                        onTap: (){
                          BgShowModalBottomSheet.build(context: context,builder: SelectAddressEmptyPages());
                        },
                        child: Image.asset("binance_game_app_assets/images/address_book_icon.png",width: 18.w,height: 18.h,),
                      ),
                      Image.asset("binance_game_app_assets/images/scan_code_icon.png",width: 18.w,height: 18.h,)
                    ],
                  ),
                  SizedBox(height: 40.h,),
                  Container(
                    height: 25.h,
                    padding: EdgeInsets.symmetric(horizontal: 80.w),
                    child: BgTabs.defaultTabs(),
                  ),
                  SizedBox(height: 40.h,),
                  Expanded(
                    child: TabBarView(
                      physics: new NeverScrollableScrollPhysics(),
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("金额"),
                              SizedBox(height: 10.h,),
                              BgTextField(
                                suffixIcons: [
                                  Text("USDT",style: Theme.of(context).inputDecorationTheme.hintStyle),
                                  Text("全部",style: Theme.of(context).textTheme.headline1.copyWith(color: ThemeColors.COLOR_E8B663),),
                                ],
                              ),
                              SizedBox(height: 5.h,),
                              Text("可用金额  120201.6852273 USDT",style: Theme.of(context).textTheme.headline2,),
                              SizedBox(height: 35.h,),
                              Text("提示"),
                              SizedBox(height: 8.h,),

                              Text.rich(TextSpan(
                                text: "*24小时可用额度",
                                children: [
                                  TextSpan(text: "1000000",style: Theme.of(context).textTheme.headline3),
                                  TextSpan(text: " USDT\n\n",style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.w500)),
                                  TextSpan(text: "*提现手续费1%\n"),
                                ],
                              ),style: Theme.of(context).textTheme.headline2.copyWith(height: 1.5),),
                              SizedBox(height: 180.h,),
                              SizedBox(
                                height: 55.h,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("实际到账："),
                                        Text.rich(TextSpan(
                                          text: "0.00",
                                          children: [
                                            TextSpan(text: " USDT",style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.w500)),
                                          ],
                                        ),style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 18.sp),),

                                        Text("手续费 0.00USDT",style: Theme.of(context).textTheme.headline2,),
                                      ],
                                    ),
                                    Spacer(),
                                    BgButtonBars.clickable(
                                      padding: EdgeInsets.symmetric(horizontal: 45.w,vertical: 8.h,),
                                      values: ["提现"],
                                      callback: (int) {
                                        BgShowModalBottomSheet.build(context: context,builder: SizedBox(
                                          height: 450.h,
                                          child: ConfirmWithdrawUsdtOrderPages(),
                                        ));
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Text("2"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
