import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/model/image_model.dart';
import 'package:untitled/util/app_constant.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/image_resources.dart';

class HomeController extends GetxController {

  RxString userEmail="".obs;
  RxString userProfile="".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }
  TextEditingController searchController = TextEditingController();

  List<ImageModel> imageModel = [
    ImageModel(
        networkImage: ImageRes.firstGuiderImage,
        distance: "13 Km Away ",
        name: "John Smith"
    ),
    ImageModel(
        networkImage: ImageRes.secondGuiderImage,
        distance: "13 Km Away ",
        name: "Miguel Farley"
    ),
    ImageModel(
        networkImage: ImageRes.thirdGuiderImage,
        distance: "13 Km Away ",
        name: "Isabelaa"
    ),
    ImageModel(
        networkImage: ImageRes.fourthGuiderImage,
        distance: "13 Km Away ",
        name: "Kamari Conley"
    ),
    ImageModel(
        networkImage: ImageRes.fifthGuiderImage,
        distance: "13 Km Away ",
        name: "Zoie Sims"
    ),
    ImageModel(
        networkImage: ImageRes.sixthGuiderImage,
        distance: "13 Km Away ",
        name: "Johnson"
    ),
    // ImageModel(networkImage: ,distance: ,name: ),
    // ImageModel(networkImage: ,distance: ,name: ),
    // ImageModel(networkImage: ,distance: ,name: ),
    // ImageModel(networkImage: ,distance: ,name: ),
    // ImageModel(networkImage: ,distance: ,name: ),
  ];

  Future<void> getProfile()async{
    await FirebaseFirestore.instance.collection("UserDetail").doc(AppPreference.getString(AppConstant.userId)).get().then((value){
      userProfile(value["profileUrl"]);
      userEmail(value["email"]);
      AppPreference.setString(AppString.userEmail, value["email"]);
      AppPreference.setString(AppString.userProfileUrl, value["profileUrl"]);
    });
  }
}
