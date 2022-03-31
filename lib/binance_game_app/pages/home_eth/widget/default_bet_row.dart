import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
import 'package:binance_game_app_single/binance_game_app/model/bet_icon/bet_icon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultBetRow extends StatefulWidget {


  const DefaultBetRow({Key key, this.initIndex, this.callback, this.betList}) : super(key: key);

  final int initIndex;

  final Function callback;

  final List<BetIconModel> betList;

  @override
  _DefaultBetRowState createState() => _DefaultBetRowState();
}

class _DefaultBetRowState extends State<DefaultBetRow> {

  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("DefaultBetRow rebuild");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i1 = 0; i1 < widget.betList.length; i1++)
          InkWell(
            onTap: (){
              setState(() {
                _currentIndex = i1;
              });
              if(widget.callback != null) {
                widget.callback(widget.betList[i1]);
              }
            },
            child: SizedBox(
              width: 44.5.w,
              height: 46.5.h,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                      "binance_game_app_assets/images/bet${_currentIndex == i1 ? widget.betList[i1].selectUrl : widget.betList[i1].url}_icon.png"),
                )),
                child: Center(
                    child: Text(
                  "${widget.betList[i1].text}",
                  textAlign: TextAlign.center,
                  style: widget.betList[i1].style,
                )),
              ),
            ),
          )
      ],
    );
  }
}
