import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';

class BodyLeftButton extends StatelessWidget {
  const BodyLeftButton(
      {Key key,
      this.decoration,
      this.bodyDecoration,
      this.bodyPadding,
      this.bodyConstraints,
      this.bodyStyle,
      this.bodyLinkStyle,
      this.bodyButtonDecoration,
      this.bodyButtonPadding,
      this.bodyButtonMargin})
      : super(key: key);

  final Decoration decoration;

  final Decoration bodyDecoration;

  final EdgeInsetsGeometry bodyPadding;

  final BoxConstraints bodyConstraints;

  final Decoration bodyButtonDecoration;

  final EdgeInsetsGeometry bodyButtonPadding;

  final EdgeInsetsGeometry bodyButtonMargin;

  final TextStyle bodyStyle;

  final TextStyle bodyLinkStyle;

  @override
  Widget build(BuildContext context) {
    List<String> _buttonValue = ["如何提现法币","USDT","BTC"];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: this.decoration,
          child: Icon(
            Icons.volume_down,
            size: 40.w,
          ),
        ),
        9.sxw,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: this.bodyConstraints,
              padding: this.bodyPadding,
              decoration: this.bodyDecoration,
              child: Text.rich(TextSpan(
                text: "请选择您需要提现的币种,您也可以直接输入，如“BTC”",
                style: this.bodyStyle,
              )),
            ),
            9.sxh,
            Row(
              children: List.generate(_buttonValue.length, (index) {
                return Container(
                  margin: bodyButtonMargin,
                  constraints: this.bodyConstraints,
                  padding: this.bodyButtonPadding,
                  decoration: this.bodyButtonDecoration,
                  child: Text("${_buttonValue[index]}"),
                );
              }),
            )
          ],
        )
      ],
    );
  }
}
