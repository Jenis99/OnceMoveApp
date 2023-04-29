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
  RxInt randomNumber = 0.obs;
  OtpFieldController otpController = OtpFieldController();
  Timer? timer;
  @override
  void onInit() {
    super.onInit();
    timeout();
    Future.delayed(
      const Duration(seconds: 1),
          () => generateOTP(),);
  }

  timeout() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second.value > 0) {
        second--;
      }
    });
  }

  void resendotp() {
    second(60);
    generateOTP();
  }

  generateOTP() {
    randomNumber(random.nextInt(9000) + 1000);
    AppSnackBar(title: AppString.successful , subtitle: randomNumber.value.toString());
       print("-----------------------${randomNumber.value}");

  }

  verifyOTP({required int pinNumber}) {
    if (pinNumber == randomNumber.value) {
      AppSnackBar(
          title: AppString.successful, subtitle: AppString.youAbleTOSetPass);
      Get.toNamed(Routes.setNewPassword);
    } else {
      AppSnackBar(
          title: AppString.successful, subtitle: AppString.enterValidOtp);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
