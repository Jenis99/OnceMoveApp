import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/module/signin/controller/forgetpassword_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/custom_widget/custom_button.dart';
import 'package:untitled/util/custom_widget/custom_textfiled.dart';
import 'package:untitled/util/custom_widget/customhead_text.dart';
import 'package:untitled/util/image_resources.dart';
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
            padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
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
                          AppText(
                            text:AppString.enterEmailToOTP,
                              fontSize: 16.sp,
                              color: ColorRes.greyText,
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
                                hintText: AppString.alexHintText,
                                validator: AppValidator.userEmailValidation,
                                suffixIcon: null),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0).w,
                  child: Obx(()=> CustomButton(
                      isLoading: forgetController.isLoading.value,
                      text: AppString.continueSpelling,
                      onTap: () {
                        if (forgetController.forgetPasswordFormKey.currentState!
                            .validate()) {
                          if(AppValidator.emailValidation(forgetController.email.text)){
                            forgetController.checkemail();
                          }
                          else{
                            AppSnackBar(title:AppString.error , subtitle: AppString.emailNotValid);
                          }
                        }
                      }),),
                )
              ],
            )),
      ),
    );
  }
}
