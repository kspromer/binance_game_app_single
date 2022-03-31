import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/model/eth_lucky_banker/eth_lucky_banker_currentbanker_data_model.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_eth/apply_banker/apply_backer_pages.dart';
import 'package:binance_game_app_single/binance_game_app/pages/home_eth/waiting_banker/waiting_banker_pages.dart';
import 'package:binance_game_app_single/binance_game_app/utils/bg_show_general_dialog.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/eth/eth_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BankerListRow extends StatelessWidget {

  const BankerListRow({Key key, this.flag = false, this.data, this.bankerType}) : super(key: key);

  final bool flag;

  final EthLuckyBankerCurrentbankerDataModel data;

  final String bankerType;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    debugPrint("BankerListRow rebuild");
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${Constant.enumTypeToStr[data.type]}：",style: theme.textTheme.bodyText2.copyWith(height: 1),),
          Text("${data.userId}",style: theme.textTheme.headline1,),
          SizedBox(width: 23.w,),
          Text("${data.money.toDouble()}",style: theme.accentTextTheme.headline2.copyWith(height: 1),),
          Text(" USDT",style: theme.textTheme.bodyText2.copyWith(fontSize: 15.sp),),
          Spacer(),
          flag ? BgButtonBars.colorR(
            values: ["申请下庄"],
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 6.h),
            callback: (index){
              EthLuckyViewModel ethLuckyViewModel = Provider.of<EthLuckyViewModel>(context,listen: false);
              ethLuckyViewModel.ethLuckyBanker();

              BgShowGeneralDialog.build(builder: WaitingBankerPages(bankerType: bankerType,),context: context);
            },
          ):
          BgButtonBars.colorG(
            values: ["申请上庄"],
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 6.h),
            callback: (index){
              BgShowGeneralDialog.build(builder: ApplyBackerPages(bankerType: bankerType,),context: context);
            },
          ),
        ],
      ),
    );
  }
}
