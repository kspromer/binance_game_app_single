import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(11.r),
        ),
      ),
      child: Text(
        "里斯不理 刚刚猜价中了236.23U",
        style:
            Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),
      ),
    );
  }
}
