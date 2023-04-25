import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_string.dart';

class CustomHeadText extends StatelessWidget{
  var name;
  CustomHeadText({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Text(name,style: TextStyle(
      fontFamily: AppString.fontPoppins,
      fontSize: 26.sp,
      fontWeight: FontWeight.w600,
    ),);
  }
}