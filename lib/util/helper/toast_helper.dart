import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/util/color_resources.dart';

class AppToast {
  static void toastMessage(String message, {Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: ColorRes.primaryColor,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 40.0.w,
    );
  }
}
