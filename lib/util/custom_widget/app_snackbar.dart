import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/util/color_resources.dart';

void AppSnackBar(String title, String Subtitle) {
  Get.snackbar(title, Subtitle,
      colorText: ColorRes.redColor,

      // colorText: ColorRes.blackColor,
  );
}
