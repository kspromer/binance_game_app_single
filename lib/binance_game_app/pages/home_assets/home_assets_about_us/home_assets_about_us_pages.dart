import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/string_extension_lib.dart';

class HomeAssetsAboutUsPages extends StatelessWidget {

  static const routeName = '/homeAssetsAboutUsPages';

  const HomeAssetsAboutUsPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: "关于我们".appbar,
      body: ListTileTheme(
        contentPadding: EdgeInsets.fromLTRB(31.w, 0, 40.w, 0),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Image.asset("binance_game_app_assets/images/ic_launcher.png",width: 85.w,height: 85.h,),
            SizedBox(height: 30.h),
            for (int i = 0; i < Constant.aboutUsModels.length; i++)
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: ThemeColors.COLOR_F7F7F7, width: 1.h),
                  ),
                ),
                child: ListTile(
                  onTap: () {

                  },
                  title: Text("${Constant.aboutUsModels[i].title}",style: Theme.of(context).textTheme.bodyText2,),
                  subtitle: Text("${Constant.aboutUsModels[i].subTitle}",style: Theme.of(context).textTheme.headline2,),
                ),
              )

          ],
        ),
      ),
    );
  }
}
