import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';

class UserProfileController extends GetxController{



  Future<void> LogOut()async{
      AppPreference.setBoolean(AppString.isLogin, value: false);
      Get.offAllNamed(Routes.signInScreen);
      AppSnackBar(AppString.successful, AppString.logoutSucceessfull);
  }
}