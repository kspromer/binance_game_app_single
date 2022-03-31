import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgShowGeneralDialog {

  final Widget builder;
  final BuildContext context;


  BgShowGeneralDialog.build({this.builder, this.context}) {
    showGeneralDialog(
      context: context,
      barrierDismissible:true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(.5),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Center(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.r))),
            child: builder,
          ),
        );
      },
    );
  }
}
