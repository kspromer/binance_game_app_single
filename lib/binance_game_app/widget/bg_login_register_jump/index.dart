import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgLoginRegisterJump extends StatelessWidget {

  final String routeName;
  final String title;

  const BgLoginRegisterJump({
    Key key,
    this.routeName,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamedAndRemoveUntil(context, this.routeName,(Route<dynamic> route) => false);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Text("${this.title}",style: Theme.of(context).accentTextTheme.bodyText1,),
      ),
    );
  }
}
