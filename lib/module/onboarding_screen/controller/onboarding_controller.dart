import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/custom_widget/custom_onboarding_view.dart';
import 'package:untitled/util/image_resources.dart';

class OnBoardingController extends GetxController {
  Image? image1;
  Image? image2;
  Image? image3;
  RxInt currentIndex = 0.obs;
  RxList customViewList = [
    CustomOnBoardingView(image: ImageRes.onBoarding, description: AppString.onBoardingLorem, headingText: AppString.onBoardIngHeading),
    CustomOnBoardingView(image: ImageRes.onBoarding, description: AppString.onBoardingLorem, headingText: AppString.onBoardIngHeading),
    CustomOnBoardingView(image: ImageRes.onBoarding, description: AppString.onBoardingLorem, headingText: AppString.onBoardIngHeading),
  ].obs;
}
