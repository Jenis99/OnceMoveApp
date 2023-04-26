import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';

class ForgetPasswordController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkemail();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();


  checkemail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: email.text.toString());
      Get.toNamed(Routes.enterOtp, arguments: {
        "email": email.text.toString(),
      }
      );
    }
    on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
    }
  }
}

