import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/model/content_model.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/custom_button.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class OnBoardingScreen extends StatelessWidget {
  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.w),
        child: Obx(
          () => Column(
            children: [
              Expanded(
                flex: 85,
                  child: PageView.builder(
                itemCount: 3,
                onPageChanged: (value) {
                  currentIndex.value = value;
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 85.h,
                      ),
                      Image.asset(contents[index].image),
                      AppText(
                          text: contents[index].title,
                          fontFamily: AppString.fontPoppins,
                          color: ColorRes.primaryColor,
                          fontSize: 27.sp,
                          fontWeight: FontWeight.w700),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppText(
                        text: contents[index].discription,
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
                },
              )),
              Expanded(
                flex: 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ),
             Visibility(
                     visible: currentIndex.value == 2,

                     child: CustomButton(
                              text: AppString.continueSpelling,
                              onTap: () {
                                Get.toNamed(Routes.accountType);
                                AppPreference.setBoolean(AppString.onBoardingValue,
                                    value: false);
                              }),
             ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    // Another Container returned
    return Container(
      height: 10,
      width: currentIndex.value == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (currentIndex.value == index)
            ? ColorRes.primaryColor
            : ColorRes.textBox,
      ),
    );
  }
}

// Widget demo (String imageUrl,String name){
//     return Text(name);
// }
