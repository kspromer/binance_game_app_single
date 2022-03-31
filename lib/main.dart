 import 'dart:io';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/pages/login/login_code_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/login/login_pages.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/auth/auth_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/betconfig/betconfig_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/eth/eth_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/klines/klines_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/message/message_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'binance_game_app/constant/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'binance_game_app/view_model/account/account_view_model.dart';
import 'binance_game_app/view_model/betrecord/betrecord_view_model.dart';
import 'binance_game_app/view_model/btc/btc_lucky_view_model.dart';
import 'binance_game_app/view_model/login/login_view_model.dart';
import 'binance_game_app/view_model/user/user_view_model.dart';
import 'binance_game_app/view_model/ws/handler/countdown_response_handler.dart';
import 'binance_game_app/view_model/ws/handler/heartbeat_response_handler.dart';
import 'binance_game_app/view_model/ws/ws_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("MyApp buld");
    try {
      if (Platform.isAndroid) {
        // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
        SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    }catch(e) {
    }

    return ScreenUtilInit(
      designSize: Size(375, 811),
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel(),),
          ChangeNotifierProvider(create: (_) => LoginViewModel(),),
          ChangeNotifierProvider(create: (_) => AccountViewModel(),),
          ChangeNotifierProvider(create: (_) => BetrecordViewModel(),),
          ChangeNotifierProvider(create: (_) => KlinesViewModel(),),
          ChangeNotifierProvider(create: (_) => MessageViewModel(),),
          ChangeNotifierProvider(create: (_) => BetconfigViewModel(),),
          ChangeNotifierProvider(create: (_) => UserViewModel(),),
          ChangeNotifierProvider(create: (_) => WsViewModel(),),
          ChangeNotifierProvider(create: (_) => HeartbeatResponseHandler(),),
          ChangeNotifierProvider(create: (_) => CountdownResponseHandler(),),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          //路由拦截
          onGenerateRoute:  onGenerateRoute,
          builder: EasyLoading.init(),
          theme: ThemeData(
            //按钮背景色
            buttonColor: Colors.red,
            //主色调
            primaryColor: Colors.white,
            //背景色
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: ThemeColors.COLOR_333333,
              unselectedItemColor: ThemeColors.COLOR_333333,
              elevation: 0.8,
              selectedLabelStyle: TextStyle(fontSize: 10.sp, color: ThemeColors.COLOR_747884,fontWeight: FontWeight.w500,height: 1.5),
              unselectedLabelStyle: TextStyle(fontSize: 10.sp, color: ThemeColors.COLOR_747884,fontWeight: FontWeight.w500,height: 1.5),
            ),
            primaryTextTheme: TextTheme(
              headline1: TextStyle(fontSize: 14.sp, color: ThemeColors.COLOR_C58B2A,fontWeight: FontWeight.w700,height: 1),
              headline2: TextStyle(fontSize: 12.sp, color: ThemeColors.COLOR_C58B2A,fontWeight: FontWeight.w700,height: 1),


            ),
            accentTextTheme: TextTheme(
              headline1: TextStyle(fontSize: 13.sp, color: ThemeColors.COLOR_BDBDBD,fontWeight: FontWeight.bold,height: 1),

              headline2: TextStyle(fontSize: 15.sp, color: ThemeColors.COLOR_303030,fontWeight: FontWeight.w700,height: 1.5),

              headline3: TextStyle(fontSize: 13.sp, color: ThemeColors.COLOR_EED7B1,fontWeight: FontWeight.w800,height: 1),
              headline4: TextStyle(fontSize: 17.sp, color: ThemeColors.COLOR_EED7B1,fontWeight: FontWeight.w700,height: 1),
              headline5: TextStyle(fontSize: 15.sp, color: ThemeColors.COLOR_747884,fontWeight: FontWeight.w500,height: 1),
              headline6: TextStyle(fontSize: 15.sp, color: ThemeColors.COLOR_747884,fontWeight: FontWeight.w900,height: 1),

              subtitle1: TextStyle(fontSize: 7.sp, color: Colors.white,fontWeight: FontWeight.w700,height: 1),
              subtitle2: TextStyle(fontSize: 13.sp, color: Colors.white,fontWeight: FontWeight.w500,height: 1),

              bodyText1: TextStyle(fontSize: 15.sp, color: ThemeColors.COLOR_E8B663,fontWeight: FontWeight.w500,height: 1),
              bodyText2: TextStyle(fontSize: 20.sp, color: ThemeColors.COLOR_E8B663,fontWeight: FontWeight.w800,height: 1),

            ),
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 13.sp, color: ThemeColors.COLOR_747884,fontWeight: FontWeight.w500,height: 1),
              headline2: TextStyle(fontSize: 10.sp, color: ThemeColors.COLOR_747884,fontWeight: FontWeight.w500,height: 1),
              headline3: TextStyle(fontSize: 10.sp, color: ThemeColors.COLOR_303030,fontWeight: FontWeight.bold,height: 1),
              headline4: TextStyle(fontSize: 15.sp, color: ThemeColors.COLOR_303030,fontWeight: FontWeight.bold,height: 1),
              headline5: TextStyle(fontSize: 16.sp, color: ThemeColors.COLOR_747884,fontWeight: FontWeight.bold,height: 1),

              headline6: TextStyle(fontSize: 9.sp, color: ThemeColors.COLOR_CCCCCC,fontWeight: FontWeight.w700,height: 1),

              subtitle1: TextStyle(fontSize: 13.sp, color: ThemeColors.COLOR_747884,fontWeight: FontWeight.w500),

              bodyText2: TextStyle(fontSize: 13.sp, color: ThemeColors.COLOR_303030,fontWeight: FontWeight.w500),
              caption: TextStyle(fontSize: 15.sp, color: ThemeColors.COLOR_303030,fontWeight: FontWeight.w500),

            ),
            cardTheme: CardTheme(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.r))),
            ),
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              filled: true,
              hintStyle: TextStyle(fontSize: 13.sp, color: ThemeColors.COLOR_CCCCCC,fontWeight: FontWeight.w500,height: 1),
              fillColor: ThemeColors.COLOR_F7F7F7,
              contentPadding: EdgeInsets.only(left: 18.w),

              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
            ),
            //按钮
            buttonBarTheme: ButtonBarThemeData(
              alignment: MainAxisAlignment.center,
            ),
            //按钮
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 52.w,vertical: 8.h,)),
                  backgroundColor: MaterialStateProperty.all(ThemeColors.COLOR_ECECEC),//背景颜色
                  overlayColor: MaterialStateProperty.all(Colors.transparent),//按下的颜色
                  foregroundColor: MaterialStateProperty.all(ThemeColors.COLOR_747884),//字体颜色
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  )),
                )
            ),
            //tabbar样式
            tabBarTheme: TabBarTheme(
              labelPadding: EdgeInsets.zero,
              labelColor: ThemeColors.COLOR_747884,
              unselectedLabelColor: ThemeColors.COLOR_747884,
              labelStyle: TextStyle(
                fontSize: 13.sp,
                color: ThemeColors.COLOR_747884,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 13.sp,
                color: ThemeColors.COLOR_747884,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
            //appbar全局样式设置
            appBarTheme: AppBarTheme(
              elevation: 0.0,
              titleSpacing: 30.w,
              centerTitle: false,
              backwardsCompatibility: false,
              backgroundColor: Colors.white,
              foregroundColor: ThemeColors.COLOR_747884,
              titleTextStyle: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: ThemeColors.COLOR_303030,
                height: 1,
              ),
            ),
            // bottomAppBarTheme:
          ),
          home: LoginPages(),
        ),
      ),
    );
  }
}
