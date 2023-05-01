import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/module/signup/controller/choose_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/custom_button.dart';
import 'package:untitled/util/custom_widget/customhead_text.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:untitled/util/routes.dart';

class choose_guide extends StatefulWidget {
  const choose_guide({Key? key}) : super(key: key);

  @override
  State<choose_guide> createState() => _choose_guideState();
}

class _choose_guideState extends State<choose_guide> {
  final ChooseController chooseController = Get.put(ChooseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 78.67.h,
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(ImageRes.backButton)),
              SizedBox(
                height: 21.67.h,
              ),
              CustomHeadText(name: AppString.lookingFor),
              AppText(
                text: AppString.selectOne,
                fontSize: 16.sp,
                color: ColorRes.greyText,
              ),
              SizedBox(
                height: 36.h,
              ),
              Obx(
                () => Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            chooseController.isCheckedFirst.value = !chooseController.isCheckedFirst.value;
                          },
                          child: chooseController.isCheckedFirst.value == true
                              ? Image.asset(
                                  ImageRes.checkedBox,
                                  height: 25.h,
                                  width: 25.w,
                                )
                              : Container(
                                  height: 24.h,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorRes.greyText, width: 2.1.w),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        AppText(
                          text: AppString.guideToHelpRunning,
                          fontSize: 18.sp,
                          fontFamily: AppString.fontPoppins,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            chooseController.isCheckedSecond.value = !chooseController.isCheckedSecond.value;
                          },
                          child: chooseController.isCheckedSecond.value == true
                              ? Image.asset(
                                  ImageRes.checkedBox,
                                  height: 25.h,
                                  width: 25.w,
                                )
                              : Container(
                                  height: 24.h,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorRes.greyText, width: 2.1.w),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        AppText(
                          text: AppString.someoneToGuide,
                          fontSize: 18.sp,
                          fontFamily: AppString.fontPoppins,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
          CustomButton(
              text: AppString.continueSpelling,
              onTap: () {
                Get.offAllNamed(Routes.bottomNavBarScreen);
              })
        ],
      ),
    ));
  }
}
