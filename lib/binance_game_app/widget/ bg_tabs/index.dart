import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgTabs extends StatefulWidget {

  final List<String> values;
  final int initIndex;
  final double height;
  final Color selectedColor;
  final Color unselectedColor;
  final Color unselectedLabelColor;
  final Function callback;
  final BorderRadiusGeometry borderRadius;

  const BgTabs({
    Key key,
    @required this.values,
    this.initIndex = 0,
    this.height,
    this.selectedColor,
    this.unselectedColor,
    this.unselectedLabelColor,
    this.callback,
    this.borderRadius,
  }) : super(key: key);

  BgTabs.defaultTabs({
    this.height,
    this.selectedColor,
    this.unselectedColor,
    this.unselectedLabelColor,
    this.callback,
    this.borderRadius,
  }):this.values = Constant.tabValues,
        this.initIndex = 0;


  @override
  _BgTabsState createState() => _BgTabsState();

}

class _BgTabsState extends State<BgTabs> {

  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initIndex;
  }

  @override
  TabBar build(BuildContext context) {
    return TabBar(
      indicatorWeight: 0.01,
      unselectedLabelColor: widget.unselectedLabelColor,
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
        if(widget.callback != null) {
          widget.callback(index);
        }
      },
      tabs: [
        for(int i = 0;i < widget.values.length;i++)
          Container(
            height: widget.height ?? 25.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _currentIndex == i ? widget.selectedColor ?? ThemeColors.COLOR_ECECEC : widget.unselectedColor ?? Colors.white,
              borderRadius: widget.borderRadius
            ),
            child: Text(widget.values[i],
              textAlign: TextAlign.center,
            ),
          )
      ],
    );
  }
}
