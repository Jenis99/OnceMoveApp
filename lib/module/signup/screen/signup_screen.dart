import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module/signup/controller/SignUpController.dart';

import 'package:untitled/util/CustomWidget/custom_button.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/CustomWidget/custom_textfiled.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/hide_keyboard.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';
import 'package:untitled/util/validation_utils.dart';

class SignupScreen extends StatelessWidget {
  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0).w,
            child: Form(
              key: signUpController.signUpFormKey,
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
                  CustomHeadText(name: AppString.capSignUp),
                  SizedBox(
                    height: 26.h,
                  ),
                  CustomTextfield(
                      name: AppString.email,
                      isPassword: false,
                      controller: signUpController.email,
                      keyType: TextInputType.text,
                      hintText: AppString.alexHintText,
                      suffixIcon: null,
                      validator: AppValidator.userEmailValidation,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  CustomTextfield(
                    name: AppString.password,
                    isPassword: true,
                    controller: signUpController.password,
                    keyType: TextInputType.text,
                    hintText: "----",
                    validator: AppValidator.passwordValidation,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  CustomTextfield(
                    name: AppString.confirmPassword,
                    isPassword: true,
                    controller: signUpController.confirm,
                    keyType: TextInputType.text,
                    hintText: "----",
                    validator: AppValidator.passwordValidation,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Center(
                    child: Text(
                      AppString.or,
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontFamily: AppString.fontLato,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 46.72.h),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(AppString.useVoiceInstead,
                          style: TextStyle(
                            color: Colors.transparent,
                            fontSize: 20.sp,
                            fontFamily: AppString.fontLato,
                            decorationColor: ColorRes.primaryColor,
                            shadows: const [
                              Shadow(
                                  color: ColorRes.primaryColor,
                                  offset: Offset(0, -3))
                            ],
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                          )),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  CustomButton(
                      text: AppString.continueSpelling,
                      onTap: () {
                        if (signUpController.signUpFormKey.currentState!
                            .validate()) {
                          HideKeyboard.hideKeyboardInApp(context);
                          Get.toNamed(Routes.profileImage);
                        }
                      }),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.signInScreen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppString.alreadyHaveAcc,
                          style: TextStyle(
                              fontSize: 20.sp, color: ColorRes.greyText),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              AppString.capSignIn,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: ColorRes.primaryColor),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 1.0).w,
                              height: 1.h,
                              width: 50.w,
                              decoration:
                                  BoxDecoration(color: ColorRes.primaryColor),
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
