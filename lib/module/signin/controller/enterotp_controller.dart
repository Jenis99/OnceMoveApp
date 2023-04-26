import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
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
    timeout();
    generateOTP();
  }

  timeout() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      second--;
      if (second == 0) {
        timer.cancel();
      }
    });
  }

void resendotp(){
    second(60);
    generateOTP();
  }


  generateOTP() {
    randomNumber(random.nextInt(9000) + 1000);
    AppToast.toastMessage("${randomNumber.value}");

  }
  verifyOTP({required int pinNumber}){
    if(pinNumber==randomNumber.value){
      AppToast.toastMessage("Now you able to set new password");
      Get.toNamed(Routes.setNewPassword);
    }
    else{
      AppToast.toastMessage("Please Enter Valid OTP");
    }
  }
}
