import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/CustomWidget/custom_button.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.w),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 85.h,
                ),
                Image.asset(ImageRes.onBoarding),
                AppText(text: AppString.onBordIngLorem,
                    fontFamily: AppString.fontPoppins,
                    color: ColorRes.primaryColor,
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w700
                ),
                SizedBox(height: 16.h,),
                AppText(text:AppString.lorem,
                  fontSize: 20.sp,
                  fontFamily: AppString.fontPoppins,
                  color: ColorRes.blackColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          CustomButton(
              text: AppString.continueSpelling,
              onTap: () {
                Get.toNamed(Routes.accountType);
              }),
        ],
      ),
    ));
  }
}

// Widget demo (String imageUrl,String name){
//     return Text(name);
// }
