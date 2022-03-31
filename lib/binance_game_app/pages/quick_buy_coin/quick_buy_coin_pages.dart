import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/pages/quick_buy_coin/widget/appbar_bottom.dart';
import 'package:binance_game_app_single/binance_game_app/pages/quick_buy_coin/widget/appbar_title.dart';
import 'package:binance_game_app_single/binance_game_app/pages/quick_buy_coin/widget/appbar_trailing.dart';
import 'package:binance_game_app_single/binance_game_app/pages/quick_buy_coin/widget/body_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickBuyCoinPages extends StatelessWidget {
  static const routeName = '/quickBuyCoinPages';

  const QuickBuyCoinPages({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.COLOR_F7F7F7,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: -10.w,
        titleTextStyle: Theme.of(context).textTheme.caption,
        actions: [
          AppbarTrailing(),
        ],
        title: AppbarTitle(),
        bottom: AppbarBottom(),
      ),
      body: SafeArea(
        child: BodyListCard(),
      ),
    );
  }
}
