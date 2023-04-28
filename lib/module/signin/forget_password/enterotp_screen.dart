import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/style.dart';
import 'package:untitled/module/signin/controller/enterotp_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/custom_button.dart';
import 'package:untitled/util/custom_widget/customhead_text.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:untitled/util/routes.dart';

class EnterOTP extends StatelessWidget {
  EnterOTP({super.key});
  EnterOtpController enterOtpController=Get.put(EnterOtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
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
                      CustomHeadText(name: AppString.otp),
                      SizedBox(
                        height: 10.h,
                      ),
                      AppText(
                        text:AppString.otpToVerify,
                          fontSize: 16.sp,
                          color: ColorRes.greyText,
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      OTPTextField(
                          controller: enterOtpController.otpController,
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldWidth: 45,
                          fieldStyle: FieldStyle.box,
                          otpFieldStyle: OtpFieldStyle(
                              focusBorderColor: ColorRes.whiteColor //(here)
                          ),
                          outlineBorderRadius: 15,
                          style: TextStyle(fontSize: 17),
                          onCompleted: (pin) {
                            enterOtpController.verifyOTP(pinNumber: int.parse(pin));
                          }),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                          child:Obx(()=> Column(
                            children: [
                              AppText(text:"00 : ${enterOtpController.second.string}",
                                  fontSize: 24.sp
                              ),
                              SizedBox(height: 6.h,),
                              GestureDetector(
                                onTap: (){
                                  enterOtpController.resendotp();
                                },
                                child: AppText(text:AppString.sendAgain,
                                    fontSize: 16.sp,
                                  color: ColorRes.greyText
                                ),
                              ),
                            ],
                          )
                      ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0).w,
                child: CustomButton(
                    text: AppString.verify,
                    onTap: () {
                      Get.toNamed(Routes.setNewPassword);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
