import 'dart:async';

import 'package:binance_game_app_single/binance_game_app/model/klines/klines_currentissueno.dart';
import 'package:binance_game_app_single/binance_game_app/model/klines/klines_history.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

class KlinesViewModel extends BaseViewModel {

  List<KlinesHistory> klinesHistorys;

  KlinesCurrentissueno klinesCurrentissueno;

  Stream<int> stream;

  KlinesViewModel() {
    stream = Stream.periodic(Duration(seconds: 1),(i) {
      print("i = ${i}");
      if (null == klinesCurrentissueno) {
        return 100;
      }else {
        return --klinesCurrentissueno.countdown;
      }
    }).asBroadcastStream();
  }
  void history({Function success}) {
    debugPrint('history');
    this.get({},path: "/app/binancegame/klines/history",success: (data){
      if (data != null) {
        klinesHistorys = [];
        data.forEach((v) {
          klinesHistorys.add(KlinesHistory.fromJson(v));
        });
      }
    });
  }

  void currentIssueNo({Function success}) {
    debugPrint('currentIssueNo');
    this.get({},path: "/app/binancegame/klines/currentIssueNo",success: (data){
      klinesCurrentissueno = KlinesCurrentissueno.fromJson(data);
    });
  }
  void initStream() {
  }

  @override
  void dispose() {
    print("KlinesViewModel dispose");
    super.dispose();

  }

}