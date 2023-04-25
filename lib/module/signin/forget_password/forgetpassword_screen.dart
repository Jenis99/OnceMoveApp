import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/module/signin/controller/forgetpassword_controller.dart';
import 'package:untitled/util/CustomWidget/custom_button.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/CustomWidget/custom_textfiled.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:untitled/util/routes.dart';
import 'package:untitled/util/validation_utils.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPasswordController forgetController =
      Get.put(ForgetPasswordController());

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0).w,
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: forgetController.forgetPasswordFormKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 31.h,
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(ImageRes.backButton)),
                          SizedBox(
                            height: 31.67.h,
                          ),
                          CustomHeadText(name: AppString.forgetPassword),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            AppString.enterEmailToOTP,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: ColorRes.greyText,
                            ),
                          ),
                          SizedBox(
                            height: 30.0.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: CustomTextfield(
                                name: AppString.email,
                                isPassword: false,
                                controller: forgetController.email,
                                keyType: TextInputType.emailAddress,
                                hintText: "Alex",
                                validator: AppValidator.userEmailValidation,
                                suffixIcon: null),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0).w,
                  child: CustomButton(
                      text: AppString.continueSpelling,
                      onTap: () {
                        if (forgetController.forgetPasswordFormKey.currentState!
                            .validate()) {
                          Get.toNamed(Routes.enterOtp);
                        }
                      }),
                )
              ],
            )),
      ),
    );
  }
}
