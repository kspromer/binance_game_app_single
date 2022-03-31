import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BgLoginJump extends StatelessWidget {
  const BgLoginJump({
    Key key,
    this.title,
    this.clickTitle,
    this.routeName,
  }) : super(key: key);

  final String title;

  final String clickTitle;

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text.rich(
          TextSpan(text: "${this.title} ", children: [
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamedAndRemoveUntil(context, this.routeName,(Route<dynamic> route) => false);
                  },
                text: "${this.clickTitle}",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: ThemeColors.COLOR_E8B663))
          ]),
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
