import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/model/image_model.dart';
import 'package:untitled/util/app_constant.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/image_resources.dart';

class HomeController extends GetxController {
  RxString userEmail = "".obs;
  RxString userProfile = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  TextEditingController searchController = TextEditingController();

  Future<void> getProfile() async {
    await FirebaseFirestore.instance.collection("UserDetail").doc(AppPreference.getString(AppConstant.userId)).get().then((value) {
      userProfile(value["profileUrl"]);
      userEmail(value["email"]);
      AppPreference.setString(AppString.userEmail, value["email"]);
      AppPreference.setString(AppString.userProfileUrl, value["profileUrl"]);
    });
  }
}
