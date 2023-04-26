import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';

class NewPasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  final newPasswordFormKey = GlobalKey<FormState>();

  Future<void> setPassword() async {
    await FirebaseAuth.instance.currentUser!
        .updatePassword(password.text.toString(),
    ).then((value) {
      AppToast.toastMessage("Your password is sucessfully Updated");
      Get.toNamed(Routes.homeScreen);
    });
  }
}
