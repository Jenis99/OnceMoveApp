import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/util/app_constant.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/routes.dart';
import 'package:uuid/uuid.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  RxString selectedfile = "".obs;
  RxString downloadURL = "".obs;
  RxString filename = "".obs;
  RxBool isLoading = false.obs;

  final ImagePicker _picker = ImagePicker();

  RxString images = "".obs;

  pickCameraImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    selectedfile.value = photo!.path;
    Get.back();
  }

  pickGalleryImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    selectedfile.value = photo!.path;
    Get.back();
  }

  Future uploadImage() async {
    isLoading(true);
    filename(Uuid().v4());
    await FirebaseStorage.instance.ref(filename.value.toString()).putFile(File(selectedfile.value)).whenComplete(() {}).then((filedata) async {
      await filedata.ref.getDownloadURL().then((fileurl) async {
        await FirebaseFirestore.instance.collection("UserDetail").doc(AppPreference.getString(AppConstant.userId)).update({
          "profileUrl": fileurl,
        }).then((value) {
          isLoading(false);
          AppSnackBar(title: AppString.successful, subtitle: AppString.imgUploaded);
          Get.toNamed(Routes.chooseGuide);
        });
      });
    });
  }
}
