import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';

class CustomOnBoardingView extends StatelessWidget {

  String image;
  String headingText;
  String  description;
  CustomOnBoardingView({required this.image,required this.description,required this.headingText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        SizedBox(
          height: 85.h,
        ),
        Image.asset(image,width: 341.w,height: 393.h,),
        AppText(
            text: headingText,
            fontFamily: AppString.fontPoppins,
            color: ColorRes.primaryColor,
            fontSize: 27.sp,
            fontWeight: FontWeight.w700),
        SizedBox(
          height: 16.h,
        ),
        AppText(
          text:description,
          fontSize: 20.sp,
          fontFamily: AppString.fontPoppins,
          color: ColorRes.blackColor,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
