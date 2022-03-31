import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgShowDialog {
  final Widget builder;
  final BuildContext context;

  BgShowDialog.build({this.builder, this.context}) {
    showDialog(
      context: context,
      builder: (context) {
        return this.builder;
      },
    );
  }
}
