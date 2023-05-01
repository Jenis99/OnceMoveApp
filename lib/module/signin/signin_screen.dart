import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module/signin/controller/signin_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/custom_widget/custom_button.dart';
import 'package:untitled/util/custom_widget/custom_textfiled.dart';
import 'package:untitled/util/custom_widget/customhead_text.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';
import 'package:untitled/util/validation_utils.dart';

class SignInScreen extends StatelessWidget {
  final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
            child: Form(
              key: signInController.signInFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 33.h,
                  ),
                  Center(
                      child: Image.asset(
                    ImageRes.splashImg,
                    width: 122.w,
                    height: 152.h,
                  )),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomHeadText(name: AppString.signIn),
                  SizedBox(
                    height: 26.h,
                  ),
                  CustomTextfield(
                    name: AppString.email,
                    isPassword: false,
                    controller: signInController.email,
                    keyType: TextInputType.text,
                    hintText: AppString.alexHintText,
                    validator: AppValidator.userEmailValidation,
                    // textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  CustomTextfield(
                    name: AppString.password,
                    isPassword: true,
                    controller: signInController.password,
                    keyType: TextInputType.visiblePassword,
                    validator: AppValidator.passwordValidation,
                    hintText: "---",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.forgetEmail);
                    },
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppString.forgetPassword,
                          style: TextStyle(
                              color: Colors.transparent,
                              fontSize: 16.sp,
                              fontFamily: AppString.fontLato,
                              decorationColor: ColorRes.primaryColor,
                              shadows: const [Shadow(color: ColorRes.primaryColor, offset: Offset(0, -3))],
                              decoration: TextDecoration.underline,
                              decorationThickness: 1),
                        )),
                  ),
                  SizedBox(
                    height: 46.h,
                  ),
                  Center(
                    child: AppText(
                      text: AppString.or,
                      fontSize: 24.sp,
                      fontFamily: AppString.fontLato,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 46.h),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppString.userVoiceInstead,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.transparent,
                            fontSize: 20.sp,
                            fontFamily: AppString.fontLato,
                            decorationColor: ColorRes.primaryColor,
                            shadows: [const Shadow(color: ColorRes.primaryColor, offset: Offset(0, -3))],
                            decorationThickness: 1,
                          ),
                        )),
                  ),
                  SizedBox(height: 50.h),
                  Obx(
                    () => CustomButton(
                        text: AppString.continueSpelling,
                        isLoading: signInController.isLoading.value,
                        onTap: () async {
                          if (signInController.signInFormKey.currentState!.validate()) {
                            if (AppValidator.emailValidation(signInController.email.text)) {
                              signInController.SignIn();
                            } else {
                              AppSnackBar(title: AppString.error, subtitle: AppString.emailNotValid);
                            }
                          }
                        }),
                  ),
                  SizedBox(
                    height: 40.0.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.signupScreen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(text: AppString.donTHaveAcc, fontSize: 20.sp, color: ColorRes.greyText),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(text: AppString.capSignUp, fontSize: 20.sp, color: ColorRes.primaryColor),
                            Container(
                              margin: const EdgeInsets.only(top: 1.0).w,
                              height: 1.h,
                              width: 50.w,
                              decoration: const BoxDecoration(color: ColorRes.primaryColor),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
