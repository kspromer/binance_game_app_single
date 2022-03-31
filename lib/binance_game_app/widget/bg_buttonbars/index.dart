import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgButtonBars extends StatelessWidget {

  final List<String> values;

  final List<Color> foregroundColors;
  final List<Color> overlayColors;
  final List<Color> backgroundColors;
  final Function callback;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry buttonPadding;

  final double fontSize;
  final double width;
  final double height;


  const BgButtonBars({
    Key key,
    this.values,
    this.foregroundColors,
    this.overlayColors,
    this.backgroundColors,
    this.callback,
    this.padding,
    this.buttonPadding,
    this.fontSize, this.width, this.height,
  }) : super(key: key);


  //不可点击
  BgButtonBars.notClickable({
    this.values,
    this.foregroundColors,
    this.overlayColors,
    this.backgroundColors,
    this.callback,
    this.padding,
    this.fontSize, this.width, this.height,
  }):this.buttonPadding = EdgeInsets.zero;

  //不可点击
  BgButtonBars.inviteRewardsBtn({
    this.values,
    this.overlayColors,
    this.callback,
    this.padding,
    this.fontSize, this.width, this.height,
  }):this.foregroundColors = [Colors.white],
        this.buttonPadding = EdgeInsets.zero,
        this.backgroundColors = [ThemeColors.COLOR_E8B663];

  //不可点击
  BgButtonBars.clickable({
    this.values,
    this.overlayColors,
    this.callback,
    this.padding,
    this.fontSize, this.width, this.height,
  }):this.foregroundColors = [Colors.white],
     this.buttonPadding = EdgeInsets.zero,
     this.backgroundColors = [ThemeColors.COLOR_747884];

  BgButtonBars.reverse({
    this.values,
    this.overlayColors,
    this.callback,
    this.padding,
    this.fontSize, this.width, this.height,
  }):this.foregroundColors = [null,Colors.white],
        this.buttonPadding = EdgeInsets.zero,
        this.backgroundColors = [null,ThemeColors.COLOR_747884];

  BgButtonBars.reverse2({
    this.values,
    this.overlayColors,
    this.callback,
    this.padding,
    this.fontSize, this.width, this.height,
  }):this.foregroundColors = [null,Colors.white,Colors.white],
        this.buttonPadding = null,
        this.backgroundColors = [null,ThemeColors.COLOR_747884,ThemeColors.COLOR_747884];


  BgButtonBars.colorR({
    this.values,
    this.overlayColors,
    this.callback,
    this.padding, this.width, this.height,
  }):this.foregroundColors = [Colors.white],
        this.buttonPadding = EdgeInsets.zero,
        this.fontSize = 13.sp,
        this.backgroundColors = [ThemeColors.COLOR_CB4055];

  BgButtonBars.colorG({
    this.values,
    this.overlayColors,
    this.callback,
    this.padding, this.width, this.height,
  }):this.foregroundColors = [Colors.white],
        this.buttonPadding = EdgeInsets.zero,
        this.fontSize = 13.sp,
        this.backgroundColors = [ThemeColors.COLOR_08A067];


  BgButtonBars.reverseGR({
    this.values,
    this.overlayColors,
    this.callback,
    this.padding
  }):this.foregroundColors = [ThemeColors.COLOR_747884,Colors.white],
        this.buttonPadding = EdgeInsets.zero,
        this.fontSize = 15.sp,
        this.width = 125.w,
        this.height = 40.h,
        this.backgroundColors = [ThemeColors.COLOR_ECECEC,ThemeColors.COLOR_747884];

  @override
  Widget build(BuildContext context) {
    debugPrint("BgButtonBars rebuild");
    Widget result = Row(
      // buttonMinWidth: 0,
      // buttonHeight: 0,
      // buttonPadding: this.buttonPadding ?? null,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < values.length; i++)
          SizedBox(
            width: width ?? null,
            height: height ?? null,
            child: TextButton(
              // autofocus: true,
              onPressed: (){
                if(callback != null) {
                  callback(i);
                }
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(foregroundColors == null ? null : foregroundColors[i]),
                overlayColor: MaterialStateProperty.all(overlayColors == null ? null : overlayColors[i]),
                backgroundColor: MaterialStateProperty.all(backgroundColors == null ? null : backgroundColors[i]),
              ),
              child: Text(values[i]),
            ),
          ),
      ],
    );


    MaterialStateProperty<TextStyle> textStyle;
    if (fontSize != null) {
      textStyle = MaterialStateProperty.all(TextStyle(fontSize: fontSize,fontWeight: FontWeight.w800));
    }

    MaterialStateProperty<EdgeInsetsGeometry> paddingM;
    if(this.padding != null) {
      paddingM = MaterialStateProperty.all(padding);
    }

    if(textStyle != null || paddingM != null) {
      result = TextButtonTheme(
        data: TextButtonThemeData(
          style: TextButtonTheme.of(context).style.copyWith(
            padding: paddingM,
            textStyle:textStyle
          ),
        ),
        child: result,
      );
    }
    return result;
  }
}
