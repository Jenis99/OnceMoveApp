import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/util/color_resources.dart';

void AppSnackBar({required String title,required String subtitle,}) {
  Get.snackbar(title, subtitle,
      colorText: (title=="error")? ColorRes.redColor :ColorRes.blackColor,

      // colorText: ColorRes.blackColor,
  );
}
