import 'package:binance_game_app_single/binance_game_app/widget/%20bg_tabs/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/string_extension_lib.dart';

class AddNewAddressPages extends StatelessWidget {

  static const routeName = '/addNewAddressPages';

  const AddNewAddressPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: "添加新地址 USDT".appbar,
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
                    hintText: "输入地址",
                    suffixIcons: [
                      Image.asset("binance_game_app_assets/images/scan_code_icon.png",width: 18.w,height: 18.h,)
                    ],
                  ),
                  SizedBox(height: 45.h,),
                  Container(
                    height: 25.h,
                    padding: EdgeInsets.symmetric(horizontal: 80.w),
                    child: BgTabs.defaultTabs(),
                  ),
                  SizedBox(height: 41.h,),
                  Expanded(
                    child: TabBarView(
                      physics: new NeverScrollableScrollPhysics(),
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("钱包标签（选填）"),
                              SizedBox(height: 10.h,),
                              BgTextField.emptySuffixIcons(
                                hintText: "输入钱包标签",
                              ),
                              SizedBox(height: 300.h,),
                              BgButtonBars.notClickable(
                                padding: EdgeInsets.symmetric(horizontal: 157.w,vertical: 13.h),
                                values: ["保存"],
                              )
                            ],
                          ),
                        ),
                        Text("2"),
                      ],
                    )
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

