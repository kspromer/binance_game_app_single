import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class InviteCountTabbarView extends StatelessWidget {

  InviteCountTabbarView({Key key, this.titleStyle, this.bodyKeyStyle}) : super(key: key);

  final List<Map> _list = [
    {"返利收入(U)": "0.00"},
    {"剩余有效天数": "639"},
    {"注册日期": "2021-05-07"},
    {"我的返利比例": "30%"},
    {"好友返利比例": "0%"},
  ];

  final TextStyle titleStyle;
  final TextStyle bodyKeyStyle;


  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = this.titleStyle ?? Theme.of(context).textTheme.headline4;

    TextStyle bodyKeyStyle = this.bodyKeyStyle ?? Theme.of(context).textTheme.headline1;

    var divider = Divider(height: 38.h,thickness: 1.h,);

    var listViewPadding = EdgeInsets.symmetric(horizontal: 22.w,vertical: 26.h);

    var sizedBox10 = SizedBox(height: 10.h,);

    var paddingTop15 = EdgeInsets.only(top: 15.h);
    return Column(
      children: [
        BgTextField(
          width: 290.w,
          height: 35.h,
          hintText: "搜索邀请码",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(17.r),
          ),
          prefixIconConstraints: BoxConstraints(minHeight: 35.w),
          prefixIcon: SizedBox(child: Align(alignment: Alignment.centerRight,child: Image.asset("binance_game_app_assets/images/search_icon.png"),),width: 40.w),
          suffixOverlay: Container(
            width: 70.w,
            decoration: BoxDecoration(
              color: ThemeColors.COLOR_E8B663,
              borderRadius: BorderRadius.circular(17.r),
            ),
            alignment: Alignment.center,
            child: Text(
              "搜索",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: listViewPadding,
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("张三的猫 158****5627",style: titleStyle),
                  sizedBox10,
                  for (int i = 0; i < _list.length; i++)
                    Padding(
                      padding: paddingTop15,
                      child: Row(
                        children: [
                          Text("${_list[i].keys.first}",style: bodyKeyStyle),
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
        ),
      ],
    );
  }
}

