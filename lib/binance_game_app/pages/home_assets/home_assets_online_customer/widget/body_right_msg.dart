import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';

class BodyRightMsg extends StatelessWidget {

  const BodyRightMsg({Key key, this.decoration, this.bodyConstraints, this.bodyPadding, this.bodyDecoration}) : super(key: key);

  final Decoration decoration;

  final BoxConstraints bodyConstraints;

  final EdgeInsetsGeometry bodyPadding;

  final Decoration bodyDecoration;


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: this.bodyConstraints,
          padding: this.bodyPadding,
          decoration: this.bodyDecoration,
          child: Text.rich(
              TextSpan(
                text: "数字货币提币未到账",
              )
          ),
        ),
        9.sxw,
        DecoratedBox(
          decoration: decoration,
          child: Icon(
            Icons.volume_down,
            size: 40.w,
          ),
        ),
      ],
    );
  }
}
