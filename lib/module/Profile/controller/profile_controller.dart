import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';

class ProfileController extends GetxController{



  Future<void> LogOut()async{
      AppPreference.setBoolean(AppString.isLogin, value: false);
      Get.offAllNamed(Routes.signInScreen);
      AppToast.toastMessage(AppString.logoutSucceessfull);
  }
}