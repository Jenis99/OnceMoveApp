import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
          child: Column(
            children: [
              SizedBox(
                height: 47.h,
              ),
              Center(
                  child: Image.asset(
                ImageRes.logo,
                height: 84.h,
                width: 169.w,
              )),
              SizedBox(
                height: 49.0.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: AppString.chooseRole,
                    fontFamily: AppString.fontLato,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorRes.blackColor,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 68).w,
                    child: Text(
                      AppString.accTypDesc,
                      style: TextStyle(
                        fontFamily: AppString.fontLato,
                        fontSize: 20.sp,
                        color: ColorRes.greyColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.signInScreen);
                          },
                          child: MyCont(ImageRes.generalUser, AppString.generalUser, AppString.takeProfessional)),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.signInScreen);
                          },
                          child: MyCont(ImageRes.guidImg, AppString.guid, AppString.takeProfessional)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget MyCont(String ImageUrl, String UserType, String UserProfessional) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: ColorRes.whiteColor, boxShadow: [
        BoxShadow(
          offset: Offset(0, 8),
          blurRadius: 36,
          spreadRadius: 0,
          color: ColorRes.accContOpasity.withOpacity(0.15),
        )
      ]),
      child: Padding(
        // horizontal: 50.0,vertical: 25.0
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 25.0).w,
        child: Column(
          children: [
            Image.asset(ImageUrl),
            SizedBox(
              height: 14.5.h,
            ),
            AppText(
              text: UserType,
              fontFamily: AppString.fontPoppins,
              fontWeight: FontWeight.bold,
              color: ColorRes.blackColor,
              fontSize: 16.sp,
            ),
            SizedBox(
              height: 4.h,
            ),
            AppText(text: UserProfessional, fontFamily: AppString.fontPoppins, color: ColorRes.greyColor, fontSize: 13.sp),
          ],
        ),
      ),
    );
  }
}
