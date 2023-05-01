import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/model/content_model.dart';
import 'package:untitled/module/onboarding_screen/controller/onboarding_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/custom_button.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingController _onBoardingController = Get.put(OnBoardingController());

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
                    itemCount: _onBoardingController.customViewList.length,
                    onPageChanged: (value) {
                      _onBoardingController.currentIndex.value = value;
                    },
                    itemBuilder: (context, index) {
                      return _onBoardingController.customViewList[index];
                    },
                  )),
              Expanded(
                flex: 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _onBoardingController.currentIndex.value == 2,
                      child: CustomButton(
                          text: AppString.continueSpelling,
                          onTap: () {
                            Get.toNamed(Routes.accountType);
                            AppPreference.setBoolean(AppString.onBoardingValue, value: false);
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
    return Container(
      height: 10,
      width: _onBoardingController.currentIndex.value == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (_onBoardingController.currentIndex.value == index) ? ColorRes.primaryColor : ColorRes.textBox,
      ),
    );
  }
}
