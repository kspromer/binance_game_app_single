import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';

class BodyListCard extends StatelessWidget {
  const BodyListCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var styleF11WMCH = Theme.of(context).textTheme.headline2;
    var styleF15WBCH = Theme.of(context).textTheme.headline4;
    var styleF20WBCH = styleF15WBCH.copyWith(fontSize: 20.sp);
    var styleF11WBCH = Theme.of(context).textTheme.headline3;

    var paddintH15 = EdgeInsets.symmetric(horizontal: 15.w);
    var paddintH28V9 = EdgeInsets.symmetric(horizontal: 28.w, vertical: 9.h);
    var paddintTop10 = EdgeInsets.only(top: 10.h);
    var paddintL20T10R15B18 = EdgeInsets.fromLTRB(20.w, 10.h, 14.5.w.h, 18.h);

    return ListView.builder(
      padding: paddintH15,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: paddintTop10,
          child: Stack(
            children: [
              Positioned(
                child: BgButtonBars(
                  backgroundColors: [ThemeColors.COLOR_CB4055],
                  foregroundColors: [Colors.white],
                  padding: paddintH28V9,
                  values: ["出售"],
                ),
                right: 15.w,
                bottom: 40.h,
              ),
              SizedBox(
                width: 345.w,
                height: 160.h,
                child: Padding(
                  padding: paddintL20T10R15B18,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "binance_game_app_assets/images/quick_buy_coin_gold_icon.png",
                            width: 20.w,
                            height: 20.h,
                          ),
                          5.sxw,
                          Text(
                            "锦鲤安全资金",
                            style: styleF15WBCH,
                          ),
                          Spacer(),
                          Text(
                            "2215 订单",
                            style: styleF11WMCH,
                          ),
                          12.sxw,
                          Text(
                            "92.55%",
                            style: styleF11WMCH,
                          ),
                        ],
                      ),
                      12.5.sxh,
                      Text(
                        "单价",
                        style: styleF11WMCH,
                      ),
                      6.sxh,
                      Row(
                        children: [
                          Text(
                            "6.44  ",
                            style: styleF20WBCH,
                          ),
                          Text("CNY"),
                        ],
                      ),
                      12.5.sxh,
                      Row(
                        children: [
                          Text(
                            "数量",
                            style: styleF11WMCH,
                          ),
                          14.sxw,
                          Text(
                            "1320,541.75 USDT",
                            style: styleF11WBCH,
                          ),
                        ],
                      ),
                      8.5.sxh,
                      Row(
                        children: [
                          Text(
                            "限额",
                            style: styleF11WMCH,
                          ),
                          14.sxw,
                          Text(
                            "￥48,000.00-￥50,000.00",
                            style: styleF11WBCH,
                          ),
                        ],
                      ),
                      // 14.5.sxh,
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 3.w,
                            height: 10.h,
                            color: ThemeColors.COLOR_07C160,
                          ),
                          6.sxw,
                          Text(
                            " 微信",
                            style: styleF11WMCH,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
