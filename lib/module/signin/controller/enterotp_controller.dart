import 'dart:async';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

class EnterOtpController extends GetxController {
  RxInt second = 60.obs;
  OtpFieldController otpController = OtpFieldController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    timeout();
  }

  timeout() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      second--;
      if (second == 0) {
        timer.cancel();
      }
    });
  }
  resendotp() {
    second(60);
  }
}
