import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/sizeutils.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  // final Color buttonColor;
  final Color? textColor;
  final String text;
  final double? fontSize;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? borderColor;
  const CustomButton({
    Key? key,
    required this.onTap,
    // required this.buttonColor,
    this.textColor,
    this.fontSize,
    this.height,
    this.width,
    this.fontWeight,
    this.color,
    this.borderColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 54.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color ?? ColorRes.primaryColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
          child: Align(
            alignment: Alignment.center,
            child: AppText(text:text,
              fontWeight: FontWeight.w400,
              fontSize: 29.sp,
             fontFamily: AppString.fontPoppins,
              color: textColor ?? ColorRes.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
