import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    debugPrint("LatestNews rebuild");
    return Row(
      children: [
        SizedBox(child: VerticalDivider(color: ThemeColors.COLOR_E4C592,width: 10,thickness: 3,),height: 11.h,),
        SizedBox(width: 13.w,),
        Image.asset("binance_game_app_assets/images/system_info_icon.png",width: 19.w,height: 15.h,),
        SizedBox(width: 7.w,),
        Text("里斯不理 刚刚第07272020期猜价中了236.23U",style: theme.textTheme.headline1.copyWith(height: 1.2),),
      ],
    );
  }
}
