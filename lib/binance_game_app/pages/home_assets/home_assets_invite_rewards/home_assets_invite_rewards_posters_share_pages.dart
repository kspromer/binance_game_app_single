import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAssetsInviteRewardsPostersSharePages extends StatelessWidget {
  const HomeAssetsInviteRewardsPostersSharePages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var styleF20WBCH = Theme.of(context).textTheme.headline4;
    var styleF15WBCH = Theme.of(context).textTheme.headline5;
    var styleF10WBCH = styleF15WBCH.copyWith(fontSize: 10.sp);
    return SizedBox(
      width: 375.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Column(
          children: [
            Text("选择海报",style: styleF20WBCH,),
            SizedBox(height: 14.h,),
            SizedBox(
              height: 240.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: ThemeColors.COLOR_747884,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    width: 150.w,
                  );
                },
              ),
            ),
            SizedBox(height: 14.h,),
            Text("分享到",style: styleF20WBCH,),
            SizedBox(height: 14.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(Constant.sharingChannelsModels.length, (index) {
                return Column(
                  children: [
                    Image.asset("${Constant.sharingChannelsModels[index].icon}",width: 50.w,height: 50.h,),
                    SizedBox(height: 12.h,),
                    Text("${Constant.sharingChannelsModels[index].title}",style: styleF10WBCH,)
                  ],
                );
              }),
            ),
            Spacer(),
            InkWell(onTap: (){
              Navigator.of(context).pop();
            },child: Center(child: Text("取消",style: styleF15WBCH,))),
          ],
        ),
      ),
    );
  }
}
