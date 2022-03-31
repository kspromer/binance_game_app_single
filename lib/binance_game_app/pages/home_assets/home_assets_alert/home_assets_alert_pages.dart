import 'package:binance_game_app_single/binance_game_app/model/message/message_list.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/message/message_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/string_extension_lib.dart';
import 'package:provider/provider.dart';

class HomeAssetsAlertPages extends StatelessWidget {
  static const routeName = '/homeAssetsAlertPages';

  const HomeAssetsAlertPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MessageViewModel messageViewModel = Provider.of<MessageViewModel>(context,listen: false);
    messageViewModel.basePageDto.page = 0;
    messageViewModel.list();
    return Scaffold(
      appBar: "Notify".appbar,
      body: Selector<MessageViewModel,List<MessageList>>(
        selector: (BuildContext context,MessageViewModel model) {
          return model.messageList;
        },
        shouldRebuild: (previous,next) {
          return true;
        },
        builder: (BuildContext context,List<MessageList> value, Widget child){
          if(value == null || value.length == 0) {
            return child;
          }
          return RefreshIndicator(
            onRefresh: () async {
              await Future<Null>.delayed(Duration(milliseconds: 900),(){
                messageViewModel.basePageDto.page = 0;
                messageViewModel.list();
              });
            },
            child: ListView.separated(
              controller: messageViewModel.scrollController,
              padding: EdgeInsets.symmetric(vertical: 40.h),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 42,thickness: 1.h,);
              },
              itemBuilder: (BuildContext context, int index) {
                final item = value[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 5.h),
                      child: Image.asset("binance_game_app_assets/images/email_icon.png",width: 18.w,height: 14.5.h,),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${item.title}"),
                          SizedBox(height: 11.h),
                          Text(
                            "${item.detail}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyText2.copyWith(fontSize: 9.sp),
                          ),
                          SizedBox(height: 14.h),
                          Text("${item.createTime}",style: theme.textTheme.headline2,),
                        ],
                      ),
                    ),
                    SizedBox(width: 35.5.w),
                  ],
                );
              },
              itemCount: value.length,
            ),
          );
        },
        child: Center(
          child: Text("暂无数据"),
        ),
      ),
    );
  }
}
