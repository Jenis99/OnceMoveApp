
import 'dart:io';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/util/image_resources.dart';

class ProfileController extends GetxController {

  RxString selectedfile = "".obs;
  RxString downloadURL = "".obs;
  final ImagePicker _picker = ImagePicker();


  RxString images = "".obs;

  pickCameraImage() async {
    XFile? photo = await _picker.pickImage(
        source: ImageSource.camera);
    selectedfile.value = photo!.path;
    uploadImage();
    // print("photo:- ${photo!.path}");
    // print("selectedfile:- ${selectedfile.value}");
  }

  pickGalleryImage() async {
    XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery);
    selectedfile.value = photo!.path;
    uploadImage();
    // print("photo:- ${photo!.path}");
    // print("selectedfile:- ${selectedfile.value}");  }
  }

  uploadImage()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/file-to-upload.png';
    File file = File(filePath);

    try {
      Reference storageReference = FirebaseStorage.instance.ref().child(selectedfile.value);
      UploadTask uploadTask = storageReference.putFile(file);
      await uploadTask.whenComplete(() async {
         downloadURL(await storageReference.getDownloadURL());
         print("Image Downloaded Sucessfull --------${downloadURL}");
      });
    } catch (e) {
      // Handle error
    }
    return downloadURL;
  }
}
