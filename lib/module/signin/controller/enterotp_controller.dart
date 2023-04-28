import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';

class EnterOtpController extends GetxController {
  RxInt second = 60.obs;
  final random = Random();
  RxInt randomNumber=0.obs;
  OtpFieldController otpController = OtpFieldController();

  @override
  void onInit() {
    super.onInit();
    generateOTP();
  }

  timeout() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      second--;
      if (second.value == 0) {
        timer.cancel();
      }
    });
  }

void resendotp(){
    second(60);
    generateOTP();
    print("resendOtp--------------");
  }


  generateOTP() {
    timeout();
    randomNumber(random.nextInt(9000) + 1000);
    AppSnackBar(AppString.successful, randomNumber.value.toString());

  }
  verifyOTP({required int pinNumber}){
    if(pinNumber==randomNumber.value){
      AppSnackBar(AppString.successful, AppString.youAbleTOSetPass);
      Get.toNamed(Routes.setNewPassword);
    }
    else{
      AppSnackBar(AppString.successful, AppString.enterValidOtp);
    }
  }
}
