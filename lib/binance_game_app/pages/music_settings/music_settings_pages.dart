import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/string_extension_lib.dart';

class MusicSettingsPages extends StatelessWidget {
  static const routeName = '/musicSettingsPages';

  MusicSettingsPages({Key key}) : super(key: key);

  ValueNotifier valueNotifier = ValueNotifier(0);

  List<String> _values = ["关闭", "开启默认音乐"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: "音乐设置".appbar,
      body: ListTileTheme(
        contentPadding: EdgeInsets.fromLTRB(31.w, 0, 40.w, 0),
        child: Column(
          children: [
            SizedBox(height: 38.h),
            Divider(height: 0),
            for (int i = 0; i < _values.length; i++)
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: ThemeColors.COLOR_F7F7F7, width: 1.h),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    valueNotifier.value = i;
                  },
                  title: Text(
                    "${_values[i]}",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  trailing: ValueListenableBuilder(
                    builder: (BuildContext context, value, Widget child) {
                      return i == valueNotifier.value
                          ? Image.asset(
                              "binance_game_app_assets/images/choose_icon.png",
                              width: 17.w,
                              height: 12.h,
                            )
                          : SizedBox.shrink();
                    },
                    valueListenable: valueNotifier,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}