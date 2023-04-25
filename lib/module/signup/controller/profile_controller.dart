
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/util/image_resources.dart';

class ProfileController extends GetxController {

  RxString selectedfile = "".obs;
  final ImagePicker _picker = ImagePicker();


  RxString images = "".obs;

  pickCameraImage() async {
    XFile? photo = await _picker.pickImage(
        source: ImageSource.camera);
    selectedfile.value = photo!.path;
    // print("photo:- ${photo!.path}");
    // print("selectedfile:- ${selectedfile.value}");
  }

  pickGalleryImage() async {
    XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery);
    selectedfile.value = photo!.path;
    // print("photo:- ${photo!.path}");
    // print("selectedfile:- ${selectedfile.value}");  }
  }
}