import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BgShowModalBottomSheet {

  final Widget builder;
  final BuildContext context;


  BgShowModalBottomSheet.build({this.builder,this.context}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r))),
        builder: (BuildContext context) {
          return builder;
        });
  }

}