import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/model/bet_record/bet_record_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/btc_lucky_bet/btc_lucky_bet_data_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/betrecord/betrecord_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/widget/%20bg_tabs/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_buttonbars/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_container/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_home_app_bar/index.dart';
import 'package:binance_game_app_single/binance_game_app/widget/bg_radio_group/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeBetRecordPages extends StatelessWidget {

  HomeBetRecordPages({Key key}) : super(key: key);

  PageController _pageController = PageController(initialPage: 0);

  PreferredSizeWidget appBar(BuildContext context) {
    return BgHomeAppBar(bottom: PreferredSize(
      preferredSize: Size(375.w, 50.h),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ThemeColors.COLOR_F7F7F7,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 200.w, 10.h),
          child: SizedBox(
            height: 25.h,
            child: BgRadioGroup(
              width: 80.w,
              height: 25.h,
              initIndex: 0,
              values: ["All","BTC"],
              callback: (index){
                _pageController.animateToPage(index,duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
              },
            ),
          ),
        ),
      ),
    )).build(context);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    BetrecordViewModel betrecordViewModel = Provider.of<BetrecordViewModel>(context,listen: false);
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: [
        for (int i1 = 0; i1 < 3; i1++)
        Selector<BetrecordViewModel,List<BetRecordModelList>>(
          selector: (BuildContext context,BetrecordViewModel model) {
            return model.betRecordModelList;
          },
          shouldRebuild: (previous,next) {
            return true;
          },
          builder: (BuildContext context,List<BetRecordModelList> value, Widget child) {
            if(value == null || value.length == 0) {
              return child;
            }

            return RefreshIndicator(
              onRefresh: () async {
                await Future<Null>.delayed(Duration(milliseconds: 900),(){
                  betrecordViewModel.basePageDto.page = 0;
                  betrecordViewModel.betrecordList();
                });
              },
              child: ListView.builder(
                itemCount: value.length,
                controller: betrecordViewModel.scrollController,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                itemBuilder: (BuildContext context, int index) {
                  BetRecordModelList data = value[index];

                  List<TableRow> tableRows = [
                    TableRow(
                        children: [
                          TableCell(child: Text('${data.symbol.replaceAll("USDT", "")} ${data.issueNo}',style: theme.textTheme.headline3.copyWith(fontWeight: FontWeight.w800))),
                          TableCell(child: Text('${data.symbol}',style: theme.textTheme.headline3.copyWith(fontWeight: FontWeight.w500))),
                          TableCell(
                              child: Text.rich(
                                TextSpan(text: "${data.close}",
                                    children: [
                                      TextSpan(text: " USDT",style: theme.textTheme.headline3)
                                    ]
                                ),
                                style: theme.textTheme.headline4,
                              )
                          ),
                        ]
                    ),
                    TableRow(children: List.generate(3, (index) => SizedBox(height: 10.h,)).toList()),
                    TableRow(
                      decoration: BoxDecoration(
                        color: ThemeColors.COLOR_F7F7F7,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),
                      children: [
                        TableCell(child: Text('Bet',)),
                        TableCell(child: Text('Price(USDT)',)),
                        TableCell(child: Text('P&L(USDT)',)),
                      ],
                    ),
                    TableRow(children: List.generate(3, (index) => SizedBox(height: 6.h,)).toList()),
                    // for (int i = 0; i < 3; i++)
                  ];

                  for (int i = 0; i < data.appBetRecordListVOS.length; i++) {
                    tableRows.add(TableRow(
                        children: [
                          TableCell(child: Text('${data.appBetRecordListVOS[i].point}',style: theme.textTheme.bodyText2,)),
                          TableCell(child: Text('${data.appBetRecordListVOS[i].money}',style: theme.accentTextTheme.headline2)),

                          buildTableCell(data, i, theme),
                        ]
                    ));
                  }

                  Widget table = Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: tableRows,
                  );

                  return BgContainer.homeBetRecord(
                    child: DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline2.copyWith(height: 1.8,),
                      child: table,
                    ),
                  );
                },
              ),
            );
          },
          child: Center(
            child: Text("暂无数据"),
          ),
        ),
      ],
    );
  }

  TableCell buildTableCell(BetRecordModelList data, int i, ThemeData theme) {
    if(data.appBetRecordListVOS[i].result == null) {
      return TableCell(child: Text('--',style: theme.accentTextTheme.headline2.copyWith(color: ThemeColors.COLOR_08A067)));
    }
    if(data.appBetRecordListVOS[i].result < 0) {
      return TableCell(child: Text('${data.appBetRecordListVOS[i].result}',style: theme.accentTextTheme.headline2.copyWith(color: ThemeColors.COLOR_08A067)));
    }else if(data.appBetRecordListVOS[i].result > 0) {
      return TableCell(child: Text('+${data.appBetRecordListVOS[i].result}',style: theme.accentTextTheme.headline2.copyWith(color: ThemeColors.COLOR_CB4055)));
    }
    return TableCell(child: Text('--',style: theme.accentTextTheme.headline2.copyWith(color: ThemeColors.COLOR_08A067)));
  }

}
