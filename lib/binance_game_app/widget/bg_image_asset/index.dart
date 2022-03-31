import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgImageAsset extends StatelessWidget {

  final AlignmentGeometry alignment;

  final String name;

  final double width;

  final double height;

  final BoxFit fit;

  const BgImageAsset({
    Key key,
    this.alignment,
    this.width,
    this.height,
    this.fit,
    @required this.name,
  }) : super(key: key);

  BgImageAsset.centerRight(this.name,{this.width,this.height}):this.alignment = Alignment.centerRight,this.fit = null;

  BgImageAsset.cover(this.name,this.width,this.height):this.alignment = null,this.fit = BoxFit.cover;

  @override
  Widget build(BuildContext context) {
    Widget result = Image.asset(this.name,width: this.width,height: this.height,fit: this.fit,);
    if(alignment == null) {
      return result;
    }
    return Align(
      alignment: alignment,
      child: result,
    );
  }
}
