import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';

class NewPasswordController extends GetxController {
  RxBool isLoading=false.obs;
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  final newPasswordFormKey = GlobalKey<FormState>();

  Future<void> setPassword() async {
    isLoading(true);
    await FirebaseFirestore.instance
        .collection("UserDetail")
        .doc(AppPreference.getString(AppString.forgetEmailDocId))
        .update({
      "password":password.text.trim()
    }).then((value) {
      isLoading(false);
      Get.offAllNamed(Routes.bottomNavBarScreen);
    });
  }
}
