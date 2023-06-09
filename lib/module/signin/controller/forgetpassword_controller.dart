import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/util/app_constant.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';

class ForgetPasswordController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  RxBool isLoading = false.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  checkemail() async {
    isLoading(true);
    await FirebaseFirestore.instance.collection("UserDetail").where("email", isEqualTo: email.text.trim()).get().then((value) {
      if (value.docs.isNotEmpty) {
        isLoading(false);
        AppPreference.setString(AppConstant.userId, value.docs.first.id);
        Get.toNamed(Routes.enterOtp);
      } else {
        isLoading(false);
        AppSnackBar(title: AppString.error, subtitle: AppString.emailNotExists);
      }
    });
  }
}
