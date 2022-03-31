import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgRadioGroup extends StatefulWidget {
  final List<String> values;
  final List<double> valueBetOns;
  final List<double> yourValueBetOns;

  final Function callback;

  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color unselectedTextColor;
  final Color selectedTextColor;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double width;
  final double height;
  final int maxLine;

  final BorderSide selectBorderSide;
  final BorderSide unselectBorderSide;
  final BorderRadius borderRadius;
  final int crossAxisCount;

  final MaterialStateProperty<TextStyle> textStyle;

  final int initIndex;

  const BgRadioGroup({
    Key key,
    this.values,
    this.valueBetOns,
    this.yourValueBetOns,
    this.callback,
    this.initIndex,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.width,
    this.height,
    this.selectedBackgroundColor,
    this.unselectedBackgroundColor,
    this.unselectedTextColor,
    this.selectedTextColor,
    this.maxLine,
    this.selectBorderSide,
    this.unselectBorderSide,
    this.borderRadius,
    this.textStyle,
    this.crossAxisCount,
  }) : super(key: key);

  BgRadioGroup.inviteRewardsUpdateRatioDialogBtns({
    this.values,
    this.callback,
    this.initIndex,
    this.valueBetOns,
    this.yourValueBetOns,
    this.unselectBorderSide,
    this.crossAxisCount,
  })  : this.textStyle = MaterialStateProperty.all(TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w800,
          height: 1,
        )),
        this.selectedBackgroundColor = Colors.white,
        this.unselectedBackgroundColor = ThemeColors.COLOR_ECECEC,
        this.selectedTextColor = ThemeColors.COLOR_E8B663,
        this.unselectedTextColor = ThemeColors.COLOR_747884,
        this.maxLine = 1,
        this.crossAxisSpacing = 10.w,
        this.mainAxisSpacing = 0,
        this.width = 60.w,
        this.height = 30.h,
        this.borderRadius = BorderRadius.all(Radius.circular(5.r)),
        this.selectBorderSide =
            BorderSide(width: 1, color: ThemeColors.COLOR_E8B663);

  @override
  _BgRadioGroupState createState() => _BgRadioGroupState();
}

class _BgRadioGroupState extends State<BgRadioGroup>
    with SingleTickerProviderStateMixin {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initIndex;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("BgRadioGroup rebuild");

    var selectBorderSide = widget.selectBorderSide ?? BorderSide.none;
    var unselectBorderSide = widget.unselectBorderSide ?? BorderSide.none;
    var borderRadius = widget.borderRadius ?? BorderRadius.zero;

    OutlinedBorder selectShape = StadiumBorder(side: selectBorderSide);
    OutlinedBorder unselectShape = StadiumBorder(side: unselectBorderSide);
    if (widget.borderRadius != null) {
      selectShape = ContinuousRectangleBorder(
          side: selectBorderSide, borderRadius: borderRadius);
      unselectShape = ContinuousRectangleBorder(
          side: unselectBorderSide, borderRadius: borderRadius);
    }

    //选中的样式
    ButtonStyle selectedStyle = ButtonStyle(
      textStyle: widget.textStyle,
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(selectShape),
      foregroundColor:
          MaterialStateProperty.all(widget.selectedTextColor ?? Colors.white),
      backgroundColor: MaterialStateProperty.all(
          widget.selectedBackgroundColor ?? ThemeColors.COLOR_747884),
    );
    //非选中的样式
    ButtonStyle unselectedStyle = ButtonStyle(
      textStyle: widget.textStyle,
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(unselectShape),
      foregroundColor: MaterialStateProperty.all(widget.unselectedTextColor),
      backgroundColor:
          MaterialStateProperty.all(widget.unselectedBackgroundColor),
    );

    double crossAxisSpacing = widget.crossAxisSpacing ?? 8.w;
    double mainAxisSpacing = widget.mainAxisSpacing ?? 10.h;
    double width = widget.width;
    double height = widget.height;
    int maxLine = widget.maxLine ?? 1;

        ThemeData theme = Theme.of(context);
    Widget result = GridView.count(
      physics: NeverScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      padding: EdgeInsets.zero,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,

      crossAxisCount: widget.crossAxisCount ?? widget.values.length,
      // maxCrossAxisExtent: width,
      childAspectRatio: width / height,
      children: List.generate(widget.values.length, (index) {
        Widget results = TextButton(
          onPressed: () {
            setState(() {
              if(index == _currentIndex) {
                _currentIndex = null;
              }else {
                _currentIndex = index;
              }
            });
            if(widget.callback != null) {
              widget.callback(_currentIndex);
            }
          },
          style: index == _currentIndex ? selectedStyle : unselectedStyle,
          child: Text("${Constant.enumTypeToStr[widget.values[index]] ?? widget.values[index]}",),
        );
        results = SizedBox(
          width: widget.width,
          height: widget.height,
          child: results,
        );

        List<Widget> _positioned = [results];
        if (widget.valueBetOns != null && widget.valueBetOns[index] != null) {
          double valueBetOn = widget.valueBetOns[index];
          _positioned.add(Positioned(
              bottom: 3.h,
              right: 3.w,
              child: Text(
                "${valueBetOn}",
                style: theme.textTheme.headline6.copyWith(color: ThemeColors.COLOR_EFD7AE.withOpacity(0.4)),
              )));
        }
        if (widget.yourValueBetOns != null &&
            widget.yourValueBetOns[index] != null && widget.yourValueBetOns[index] > 0) {
          double yourValueBetOn = widget.yourValueBetOns[index];
          _positioned.add(Positioned(
              top: -7.5.h,
              right: -7.5.w,
              child: Container(
                padding: EdgeInsets.all(4.5.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeColors.COLOR_F86363,
                ),
                child: Text(
                  "${yourValueBetOn.toInt()}",
                  style: theme.accentTextTheme.subtitle1,
                ),
              )));
        }
        if (_positioned.length > 0) {
          results = Stack(
            clipBehavior: Clip.none,
            children: _positioned,
          );
        }
        return results;
      }).toList(),
    );
    return SizedBox(
      height: (maxLine * height) + (maxLine - 1) * mainAxisSpacing,
      child: TextButtonTheme(
        data: TextButtonTheme.of(context),
        child: result,
      ),
    );
  }
}
