import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarTitle extends StatelessWidget {

  const AppbarTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("自选区"),
        Icon(Icons.arrow_drop_down),
      ],
    );
  }
}
