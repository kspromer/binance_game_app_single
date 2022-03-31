import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/dto/login/login_dto.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home/home_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/login/login_code_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/register/register_pages.dart';
import 'package:binance_game_app_single/binance_game_app/utils/cache_util.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/login/login_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_login_jump/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_login_register_jump/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_service_agreement/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class LoginPages extends StatelessWidget {
  static const routeName = '/loginPages';

  LoginPages({Key key}) : super(key: key);

  TextEditingController username = TextEditingController(text: "");

  TextEditingController password = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BgLoginRegisterJump(title: "Register",routeName: RegisterPages.routeName,),
          SizedBox(
            width: 14.w,
          ),
        ],
        bottom: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Log in",
          ),
        ),
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("username"),
                SizedBox(height: 11.5.h),
                BgTextField.emptySuffixIcons(
                    hintText: "Please enter username",
                    controller: username,
                ),
                SizedBox(height: 26.h),
                Text("Password"),
                SizedBox(height: 11.5.h),
                BgTextField(
                  hintText: "Please enter password",
                  controller: password,
                  obscureText: true,
                  suffixIcons: [
                    Image.asset(
                      "binance_game_app_assets/images/switch_eyes_icon.png",
                      width: 12.w,
                      height: 12.h,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                // BgLoginJump(title: "Forget password?",clickTitle: "SMS verification",routeName: LoginCodePages.routeName,),
                SizedBox(height: 360.h),
                BgServiceAgreement(
                  onTab: () {
                    if(TextUtil.isEmpty(username.text)) {
                      EasyLoading.showToast("user name cannot be empty");
                      return;
                    }
                    if(TextUtil.isEmpty(password.text)) {
                      EasyLoading.showToast("password cannot be empty");
                      return;
                    }
                    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context,listen: false);
                    LoginDto dto = LoginDto();
                    dto.username = username.text;
                    dto.passwordNo = password.text;
                    loginViewModel.login(dto,success: (data) {
                      CacheUtil.saveData<String>(Constant.AUTHORIZATION, data);
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomePages.routeName,
                              (Route<dynamic> route) => false);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
