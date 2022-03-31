import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawalUsdtPages extends StatelessWidget {
  static const routeName = '/withdrawalUsdtPages';

  const WithdrawalUsdtPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "提现 USDT",
          ),
        ),
      ),
      body: Text("提现 USDT"),
    );
  }
}
