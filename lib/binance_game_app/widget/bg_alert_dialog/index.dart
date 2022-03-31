import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgAlertDialog extends StatelessWidget {

  const BgAlertDialog({Key key, this.success}) : super(key: key);

  final Function success;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      contentPadding: EdgeInsets.symmetric(vertical: 30.h),
      titlePadding: EdgeInsets.only(top: 20.h),
      actionsPadding: EdgeInsets.only(bottom: 20.h),
      titleTextStyle: Theme.of(context).textTheme.headline4,
      title: Center(child: Text('清空缓存')),
      content: Text('确定要清理缓存吗？',textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyText2,),
      actions: <Widget>[
       BgButtonBars.reverse(
         padding: EdgeInsets.symmetric(horizontal: 35.w,vertical: 13.h),
         values: ["取消","确认"],
         callback: (index){
           Navigator.of(context).pop();
           if(index == 1) {
             success();
           }
         }
       )
      ],
    );
  }
}
