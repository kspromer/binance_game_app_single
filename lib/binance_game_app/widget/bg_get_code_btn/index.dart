import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BgGetCodeBtn extends StatelessWidget {
  const BgGetCodeBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel model = Provider.of<LoginViewModel>(context,listen: false);
    return GestureDetector(
      onTap: (){
        model.getCodeUrl();
      },
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: ThemeColors.COLOR_747884,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.r), bottomRight: Radius.circular(5.r)),
        ),
        child: Consumer<LoginViewModel>(
            builder: (_,model,child) {
              return Image.network(model.codeUrl,width: 100.w,height: 70.h,fit: BoxFit.fill,);
            },
            child: Image.network(model.codeUrl,width: 100.w,height: 70.h,fit: BoxFit.fill,)
        ),
      ),
    );
  }
}
