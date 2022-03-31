import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/model/minute_10_value/minute_10_value_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_game_app_single/binance_game_app/extensions/double_extension_lib.dart';
import 'package:provider/provider.dart';
class Nearly10MinutesTable extends StatelessWidget {

  const Nearly10MinutesTable({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("Nearly10MinutesTable rebuild");
    //边框颜色
    var border = BorderSide(color: ThemeColors.COLOR_F7F7F7);
    //表格距离
    Map<int, TableColumnWidth> columnWidths = {
      0: FlexColumnWidth(1.7),
    };
    var flex1 = FlexColumnWidth(1);
    List.generate(10, (index) {
      columnWidths[index + 1] = flex1;
    });
    //表格头样式
    var styleTableHead = Theme.of(context)
        .textTheme
        .headline1
        .copyWith(color: ThemeColors.COLOR_999999);
    //表格字体样式
    var style10Minutes =
        Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 11.sp);
    //表格边距
    var paddintVertical = EdgeInsets.symmetric(vertical: 10.h);

    var successImage = Image.asset(
      "binance_game_app_assets/images/answer_err_icon.png",
      width: 20.w,
      height: 20.h,
    );

    var errImage = Image.asset(
      "binance_game_app_assets/images/answer_icon.png",
      width: 20.w,
      height: 20.h,
    );

    return DefaultTextStyle(
      textAlign: TextAlign.center,
      style: style10Minutes,
      child: Selector<BtcLuckyViewModel,List<Minute10ValueModel>>(
        builder: (BuildContext context,List<Minute10ValueModel> value, Widget child) {
          print("Minute10ValueModel build ${value}");
          List<TableCell> rows1 = [TableCell(
            child: Text(
              '扫牛',
              style: styleTableHead,
            ),
          )];

          List<TableCell> rows2 = [TableCell(
            child: Text(
              '最高价️',
              style: styleTableHead,
            ),
          )];

          List<TableCell> rows3 = [TableCell(
            child: Text(
              '最低价️',
              style: styleTableHead,
            ),
          )];


          for (int i = 0; i < value.length; i++) {
            if(value == null)continue;
            rows1.add(TableCell(
              child: Padding(
                padding: paddintVertical,
                child: Text('${value[i].niu}'),
              ),
            ));

            rows2.add(TableCell(
              child: Padding(
                padding: paddintVertical,
                child: value[i].bet1 ?? false ? successImage : errImage,
              ),
            ));

            rows3.add(TableCell(
              child: Padding(
                padding: paddintVertical,
                child: value[i].bet2 ?? false ? successImage : errImage,
              ),
            ));
          }




          return Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder(
              top: border,
              left: border,
              right: border,
              bottom: border,
              horizontalInside: border,
              verticalInside: border,
            ),
            columnWidths: columnWidths,
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.white),
                children: rows1,
              ),
              TableRow(
                decoration: BoxDecoration(color: ThemeColors.COLOR_FAFAFA),
                children: rows2,
              ),
              TableRow(
                decoration: BoxDecoration(color: ThemeColors.COLOR_FAFAFA),
                children: rows3,
              ),
            ],
          );
        },
        selector: (BuildContext context,BtcLuckyViewModel model) {
          return model.minute10ValueModel;
        },
        child: Container(),
      ),
    );
  }
}
