import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/util/color_resources.dart';

void AppSnackBar(String title, String Subtitle,Color color) {
  Get.snackbar(title, Subtitle,
      colorText:color ?? ColorRes.redColor,

      // colorText: ColorRes.blackColor,
  );
}
