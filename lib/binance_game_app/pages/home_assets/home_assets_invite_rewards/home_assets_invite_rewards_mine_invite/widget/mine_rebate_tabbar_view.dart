import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MineRebateTabbarView extends StatelessWidget {
  final TextStyle titleStyle;
  final TextStyle bodyKeyStyle;

  MineRebateTabbarView({Key key, this.titleStyle, this.bodyKeyStyle})
      : super(key: key);

  final List<Map> _list = [
    {"USDT返利": "37.02"},
    {"点卡返利": "0.00"},
    {"HT返利": "0.00"},
    {"合计(折算USDT)": "37.02"},
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle =
        TextStyle(fontSize: 15.sp, height: 1, fontWeight: FontWeight.w800);

    TextStyle titleStyle =
        this.titleStyle ?? Theme.of(context).textTheme.headline4;

    TextStyle bodyKeyStyle =
        this.bodyKeyStyle ?? Theme.of(context).textTheme.headline1;

    var divider = Divider(
      height: 38.h,
      thickness: 1.h,
    );

    var listViewPadding =
        EdgeInsets.symmetric(horizontal: 22.w, vertical: 26.h);

    var sizedBox10 = SizedBox(
      height: 10.h,
    );

    var paddingTop15 = EdgeInsets.only(top: 15.h);

    return DefaultTabController(
      length: 4,
      child: Theme(
        data: Theme.of(context).copyWith(
            tabBarTheme: TabBarTheme.of(context).copyWith(
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: labelStyle,
          unselectedLabelStyle: labelStyle,
          labelColor: ThemeColors.COLOR_E8B663,
        )),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
              child: TabBar(
                indicatorColor: ThemeColors.COLOR_E8B663,
                indicatorWeight: 2.h,
                tabs: [
                  Text("全部"),
                  Text("昨日"),
                  Text("本周"),
                  Text("本月"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  for (int i = 0; i < 4; i++)
                    ListView.separated(
                      padding: listViewPadding,
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("2021-06-14", style: titleStyle),
                            sizedBox10,
                            for (int i = 0; i < _list.length; i++)
                              Padding(
                                padding: paddingTop15,
                                child: Row(
                                  children: [
                                    Text("${_list[i].keys.first}",
                                        style: bodyKeyStyle),
                                    Text("${_list[i].values.first}"),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                ),
                              )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return divider;
                      },
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
