import 'dart:typed_data';
import 'dart:ui';

import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BgDropUpText extends StatelessWidget {

  final String value;

  final TextStyle style;

  final int point;

  final Color textColor;

  const BgDropUpText({Key key,this.value,this.style,this.point, this.textColor}):super(key: key);

  BgDropUpText.point3(this.value, this.textColor):
        this.point = 3,
        this.style = TextStyle(fontSize: 17.sp, color: textColor ?? ThemeColors.COLOR_EED7B1,fontWeight: FontWeight.w800,height: 1,);

  BgDropUpText.point2(this.value, this.textColor):
        this.point = 2,
        this.style = TextStyle(fontSize: 17.sp, color: textColor ?? ThemeColors.COLOR_EED7B1,fontWeight: FontWeight.w800,height: 1,);


  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: BgDropUpPainter("$value",style: this.style,point: this.point),
        child: Text("$value",style: style,),
      ),
    );
  }




}


class BgDropUpPainter extends CustomPainter { //         <-- CustomPainter class

  final String value;

  final TextStyle style;
  final int point;

  BgDropUpPainter(this.value,{this.style,this.point});

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint("BgDropUpPainter repaint");
    var paint1 = Paint()..color = ThemeColors.COLOR_F8F9FA;
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    //获取最大的尺寸
    double maxWidth = size.width;
    //循环进行画圆形
    int j = 0;
    for (int i = value.length; i >= 0; i--) {
      if(j > point) break;
      painter..text = TextSpan(text: "${value.substring(0,i - 1)}", style: style);
      painter.layout();
      double cWidth = maxWidth - painter.width;
      if(j != 2){
        canvas.drawCircle(Offset(painter.width + cWidth / 2, 17.sp + 3.h), 2, paint1);
      }
      maxWidth = painter.width;
      j++;
    }
  }

  @override
  bool shouldRepaint(covariant BgDropUpPainter old) {
    return old.value != this.value;
  }
}
