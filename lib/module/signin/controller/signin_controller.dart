import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/util/app_constant.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/routes.dart';

class SignInController extends GetxController {
  RxString enterEmail = "".obs;
  RxString enterPassword = "".obs;
  RxBool isLoading = false.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  SignIn() async {
    isLoading(true);
    await FirebaseFirestore.instance
        .collection("UserDetail")
        .where(
          "email",
          isEqualTo: email.text.trim(),
        )
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        isLoading(false);
        if (value.docs.first.data()["password"] == password.text.trim()) {
          AppPreference.setString(AppConstant.userId, value.docs.first.id);
          AppSnackBar(title: AppString.successful, subtitle: AppString.loginSuccessful);
          Get.offAllNamed(Routes.bottomNavBarScreen);
          AppPreference.setBoolean(AppString.isLogin, value: true);
        } else {
          AppSnackBar(title: AppString.error, subtitle: AppString.plsEnterPass);
        }
      } else {
        isLoading(false);
        AppSnackBar(title: AppString.error, subtitle: AppString.emailNotExists);
      }
    });
  }
}
