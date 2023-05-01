import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/util/app_constant.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/routes.dart';

class SignUpController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  RxBool isLoading = false.obs;

  final signUpFormKey = GlobalKey<FormState>();

  Singup() async {
    if (password.text == confirm.text) {
      isLoading(true);
      await FirebaseFirestore.instance.collection("UserDetail").where("email", isEqualTo: email.text.trim()).get().then((value) {
        if (value.docs.isEmpty) {
          FirebaseFirestore.instance.collection("UserDetail").add({
            "email": email.text.trim(),
            "username": username.text,
            "password": password.text.trim(),
          }).then((value) async {
            isLoading(false);
            AppPreference.setString(AppConstant.userId, value.id);

            Get.toNamed(Routes.profileImage);
            AppSnackBar(title: AppString.successful, subtitle: AppString.accCreateSuccess);
            AppPreference.setBoolean(AppString.isLogin, value: true);
          });
        } else {
          isLoading(false);
          AppSnackBar(title: AppString.error, subtitle: AppString.emailAlreadyExits);
        }
      });
    } else {
      AppSnackBar(title: AppString.error, subtitle: AppString.passwordNotMatch);
    }
  }
}
