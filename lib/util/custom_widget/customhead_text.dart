import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';

class CustomHeadText extends StatelessWidget{
  var name;
  CustomHeadText({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return AppText(text:name,
      fontFamily: AppString.fontPoppins,
      fontSize: 26.sp,
      fontWeight: FontWeight.w600,
    );
  }
}