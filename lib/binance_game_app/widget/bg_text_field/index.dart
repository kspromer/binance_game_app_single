import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgTextField extends StatelessWidget {
  final List<Widget> suffixIcons;

  final Widget suffixOverlay;

  final String hintText;

  final double width;

  final double height;

  final TextAlign textAlign;

  final Widget prefixIcon;

  final TextStyle style;

  final BoxConstraints prefixIconConstraints;

  final InputBorder border;

  final Color fillColor;

  final TextEditingController controller;

  final TextInputType keyboardType;

  final bool obscureText;

  const BgTextField({
    Key key,
    this.suffixIcons,
    this.suffixOverlay,
    this.hintText,
    this.width,
    this.height,
    this.textAlign,
    this.prefixIcon,
    this.style,
    this.prefixIconConstraints,
    this.border,
    this.fillColor,
    this.controller, this.keyboardType, this.obscureText,
  }) : super(key: key);

  BgTextField.emptySuffixIcons({
    this.hintText,
    this.suffixOverlay,
    this.width,
    this.height,
    this.textAlign,
    this.prefixIcon,
    this.style,
    this.prefixIconConstraints,
    this.border,
    this.fillColor,
    this.controller, this.keyboardType, this.obscureText,
  }) : this.suffixIcons = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width ?? 345.w,
      height: this.height ?? 45.h,
      child: TextField(
        keyboardType: this.keyboardType,
        textAlign: this.textAlign ?? TextAlign.start,
        obscureText: obscureText ?? false,
        style: this.style ?? TextStyle(
          color: ThemeColors.COLOR_303030,
        ),
        controller: controller,
        decoration: InputDecoration(
          border: border,
          fillColor: this.fillColor,
          contentPadding: EdgeInsets.zero,
          prefixIconConstraints: prefixIconConstraints ?? BoxConstraints.expand(width: 19.5.w,height: 0.h),
          prefixIcon: prefixIcon ?? SizedBox(width: 19.5.w,),
          suffixIcon: suffixOverlay ??
              (suffixIcons == null
                  ? SizedBox.shrink()
                  : GestureDetector(
                      // onTap: (){
                      //   FocusScope.of(context).unfocus();
                      //   FocusScope.of(context).canRequestFocus = false;
                      //   Future.delayed(Duration(milliseconds: 100),(){
                      //     FocusScope.of(context).canRequestFocus = true;
                      //   });
                      // },
                      child: SizedBox(
                        width: 95.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            for (int i = 0; i < suffixIcons.length; i++)
                              Padding(
                                padding: EdgeInsets.only(right: 13.w),
                                child: suffixIcons[i],
                              ),
                            SizedBox(
                              width: 6.w,
                            ),
                          ],
                        ),
                      ),
                    )),
          hintText: hintText,
        ),
      ),
    );
  }
}
