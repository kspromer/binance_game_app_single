import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home/home_pages.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class BgServiceAgreement extends StatelessWidget {

  BgServiceAgreement({Key key, this.onTab}) : super(key: key);

  final ValueNotifier<bool> _offONValueNotifier = ValueNotifier(false);

  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: _offONValueNotifier,
          builder:
              (BuildContext context, bool value, Widget child) {
            return InkWell(
              onTap: () {
                _offONValueNotifier.value = !value;
              },
              child: Image.asset(
                "binance_game_app_assets/images/${value ? 'radio_on.png' : 'radio_off.png'}",
                width: 12.w,
                height: 12.h,
              ),
            );
          },
        ),
        SizedBox(width: 5.w),
        Text.rich(
          TextSpan(text: "I agree to Biquan's ", children: [
            TextSpan(
                text: "service agreement",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: ThemeColors.COLOR_E8B663))
          ]),
        ),
        Spacer(),
        Consumer<AuthViewModel>(
          builder: (BuildContext context,model,child){
            return model.loading ?
            Image.asset(
              "binance_game_app_assets/images/next_btn_icon.png",
              width: 50.w,
              height: 50.h,
            ):
            InkWell(
              onTap: (){
                if(!_offONValueNotifier.value) {
                  EasyLoading.showToast("Please select service agreemet");
                  return;
                }
                if(!model.loading && onTab != null) {
                  onTab();
                }
              },
              child: Image.asset(
                "binance_game_app_assets/images/next_btn_click_icon.png",
                width: 50.w,
                height: 50.h,
              ),
            );
          },
        )
      ],
    );
  }
}
