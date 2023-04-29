import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/module/Home/controller/home_controller.dart';
import 'package:untitled/util/app_constant.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';
import 'package:uuid/uuid.dart';

class UserProfileController extends GetxController {
  HomeController homeController=Get.find();
  RxString selectedfile = "".obs;
  RxString downloadURL = "".obs;
  RxString filename = "".obs;
  RxBool isLoading = false.obs;

  final ImagePicker _picker = ImagePicker();

  RxString images = "".obs;

  pickCameraImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    selectedfile.value = photo!.path;
    uploadImage();
  }

  pickGalleryImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    selectedfile.value = photo!.path;
    uploadImage();
  }

  Future uploadImage() async {
    isLoading(true);
    filename(Uuid().v4());
    await FirebaseStorage.instance
        .ref(filename.value.toString())
        .putFile(File(selectedfile.value))
        .whenComplete(() {})
        .then((filedata) async {
      await filedata.ref.getDownloadURL().then((fileurl) async {
        await FirebaseFirestore.instance
            .collection("UserDetail")
            .doc(AppPreference.getString(AppConstant.userId))
            .update({
          "profileUrl": fileurl,
        }).then((value) {
          print("${homeController.userProfile.value}-------------");
          homeController.userProfile(fileurl);
          isLoading(false);
          print("${homeController.userProfile.value}-------------");
          downloadURL(fileurl);
          AppSnackBar(
              title: AppString.successful, subtitle: AppString.imgUploaded);
        });
      });
    });
  }

  Future<void> LogOut() async {
    AppPreference.setBoolean(AppString.isLogin, value: false);
    Get.offAllNamed(Routes.signInScreen);
    AppSnackBar(
        title: AppString.successful, subtitle: AppString.logoutSucceessfull);
  }
}
