import 'package:binance_game_app_single/binance_game_app/dto/btc_lucky_banker_delete/btc_lucky_banker_delete_dto.dart';
import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_banker/btc_lucky_banker_bankerqueuemap_data_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_banker/btc_lucky_banker_currentbanker_data_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_banker/btc_lucky_banker_get_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/user/user_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class WaitingBankerPages extends StatelessWidget {

  const WaitingBankerPages({Key key, this.data, this.bankerType}) : super(key: key);

  final BtcLuckyBankerCurrentbankerDataModel data;

  final String bankerType;

  @override
  Widget build(BuildContext context) {
    // List<Map> _list = [
    //   {"张三的猫":"3100.00"},
    //   {"里斯的狗":"2500.00"},
    //   {"玩给的鱼":"2200.00"},
    //   {"嘴界的达芬奇":"2000.00"},
    //   {"印度阿三":"1500.00"},
    // ];
    return SizedBox(
      width: 280.w,
      height: 250.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w,vertical: 20.h),
        child: Column(
          children: [
            Text("等待上庄列表：",style: Theme.of(context).accentTextTheme.bodyText1.copyWith(color: Colors.black),),
            5.sxh,
            Selector(
              selector: (BuildContext context,BtcLuckyViewModel model) {
                return model.btcLuckyBankerGetModel.bankerQueueMap;
              },
              builder: (BuildContext context,BankerQueueMap value, Widget child) {
                List<BtcLuckyBankerBankerqueuemapDataModel> btcLuckyBankerBankerqueuemapDataModel;
                if(this.bankerType == "NN"){
                  btcLuckyBankerBankerqueuemapDataModel = value.nn;
                }else if(this.bankerType == "SN"){
                  btcLuckyBankerBankerqueuemapDataModel = value.sn;
                }
                return Column(
                  children: List.generate(btcLuckyBankerBankerqueuemapDataModel.length, (index){
                    return Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Row(
                        children: [
                          Text("${btcLuckyBankerBankerqueuemapDataModel[index].id}",style: Theme.of(context).textTheme.headline1,),
                          Spacer(),
                          Text("${btcLuckyBankerBankerqueuemapDataModel[index].money}  ",style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.w700),),
                          Text("USDT",style: Theme.of(context).textTheme.headline1,),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            Spacer(),
            BgButtonBars.colorG(
              padding: EdgeInsets.symmetric(horizontal: 80.w,vertical: 10.h),
              values: ["取消等待"],
              callback: (index){
                BtcLuckyBankerDeleteDto dto = BtcLuckyBankerDeleteDto();
                dto.bankerType = bankerType;
                BtcLuckyViewModel btcLuckyViewModel = Provider.of<BtcLuckyViewModel>(context,listen: false);

                UserViewModel userViewModel = Provider.of<UserViewModel>(context,listen: false);
                btcLuckyViewModel.btcLuckyBankerDelete(dto,success: (data){

                  btcLuckyViewModel.btcLuckyBanker(success: (data){
                    userViewModel.user(success: (data){
                      EasyLoading.showToast("下庄成功");
                      Navigator.of(context).pop();
                    });
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}


