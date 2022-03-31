import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';

class BodyLeftLink extends StatelessWidget {


  const BodyLeftLink({Key key, this.decoration, this.bodyDecoration, this.bodyPadding, this.bodyConstraints, this.bodyStyle, this.bodyLinkStyle}) : super(key: key);

  final Decoration decoration;

  final Decoration bodyDecoration;

  final EdgeInsetsGeometry bodyPadding;

  final BoxConstraints bodyConstraints;

  final TextStyle bodyStyle;

  final TextStyle bodyLinkStyle;


  @override
  Widget build(BuildContext context) {
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
        Container(
          constraints: this.bodyConstraints,
          padding: this.bodyPadding,
          decoration: this.bodyDecoration,
          child: Text.rich(
              TextSpan(
                  text: "为了更好的保护账号安全，目前手机号注册用户都需要启用双重验证（邮箱和谷歌验证器二选一）。在成功绑定后，您可以正常使用账户功能。如果需要帮助，可以通过以下教程查看详细额绑定步骤：",
                  style: this.bodyStyle,
                  children: [
                    TextSpan(text: "如何绑定谷歌  ",style: this.bodyLinkStyle),
                    TextSpan(text: "如何绑定邮箱  ",style: this.bodyLinkStyle),
                  ]
              )
          ),
        )
      ],
    );
  }
}
