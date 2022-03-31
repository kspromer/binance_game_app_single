import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgCircleAvatar extends StatelessWidget {

  const BgCircleAvatar({Key key,this.radius,this.url}) : super(key: key);

  final double radius;

  final String url;

  BgCircleAvatar.backgroundImage(this.url,{
    this.radius,
  });


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: this.radius,
      backgroundImage: NetworkImage(this.url),
    );
  }
}
