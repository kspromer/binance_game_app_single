import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/dto/auth_code/auth_code_dto.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home/home_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/register/register_pages.dart';
import 'package:binance_game_app_single/binance_game_app/utils/cache_util.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/auth/auth_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_get_code_btn/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_login_jump/index.dart';
import 'package:common_utils/common_utils.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_service_agreement/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_text_field/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginCodePages extends StatelessWidget {
  static const routeName = '/loginCodePages';

  LoginCodePages({Key key}) : super(key: key);

  TextEditingController url = TextEditingController(text: "192.168.31.85");

  TextEditingController phone = TextEditingController(text: "17638155659");

  TextEditingController code = TextEditingController(text: "666666");

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            // BgLoginRegisterJump(title: "注册",routeName: RegisterPages.routeName,),
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
                  Text("域名"),
                  SizedBox(height: 11.5.h),
                  BgTextField.emptySuffixIcons(
                    hintText: "请输入域名",
                    controller: url,
                  ),
                  SizedBox(height: 26.h),
                  Text("手机"),
                  SizedBox(height: 11.5.h),
                  BgTextField.emptySuffixIcons(
                    hintText: "请输入手机号",
                    controller: phone,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 26.h),
                  Text("短信验证码"),
                  SizedBox(height: 11.5.h),
                  BgTextField(
                    controller: code,
                    hintText: "请输入短信验证码",
                    keyboardType: TextInputType.number,
                    suffixOverlay: BgGetCodeBtn(),
                  ),
                  SizedBox(height: 10.h),
                  // BgLoginJump(title: "",clickTitle: "密码登录",routeName: LoginPages.routeName,),
                  SizedBox(height: 300.h),
                  BgServiceAgreement(
                    onTab: () async {
                      await CacheUtil.removeData<String>(Constant.AUTHORIZATION);
                      if(!RegexUtil.isMobileExact(phone.text)) {
                        EasyLoading.showToast("手机号格式不正确");
                        return;
                      }
                      if(TextUtil.isEmpty(code.text)) {
                        EasyLoading.showToast("验证码不能为空");
                        return;
                      }

                      Constant.domainUrl = url.text;

                      AuthViewModel authViewModel = Provider.of<AuthViewModel>(context,listen: false);


                      AuthCodeDto dto = AuthCodeDto();
                      dto.phone = phone.text;
                      dto.code = code.text;



                      authViewModel.authCode(dto, success: (value) {
                        CacheUtil.saveData<String>(Constant.AUTHORIZATION, value);
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomePages.routeName,
                                (Route<dynamic> route) => false);
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
