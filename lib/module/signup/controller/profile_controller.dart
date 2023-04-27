import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/util/app_constant.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:uuid/uuid.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    uploadImage();
  }

  RxString selectedfile = "".obs;
  RxString downloadURL = "".obs;
  RxString filename = "".obs;

  final ImagePicker _picker = ImagePicker();

  RxString images = "".obs;

  pickCameraImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    selectedfile.value = photo!.path;
    uploadImage();
    // print("photo:- ${photo!.path}");
    // print("selectedfile:- ${selectedfile.value}");
  }

  pickGalleryImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    selectedfile.value = photo!.path;

    uploadImage();
    // print("photo:- ${photo!.path}");
    // print("selectedfile:- ${selectedfile.value}");  }
  }

  // uploadImage()async{
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   String filePath = '${appDocDir.absolute}/file-to-upload.png';
  //   File file = File(filePath);
  //   print("------------------------------${file}");
  //
  //
  //   //final ref = FirebaseStorage.instance.ref().child('testimage');
  //   // // no need of the file extension, the name will do fine.
  //   // var url = await ref.getDownloadURL();
  //   // print(url);
  //   //last try
  //   //https://stackoverflow.com/questions/50877398/flutter-load-image-from-firebase-storage
  //
  //
  //
  //   try {
  //     Reference storageReference = FirebaseStorage.instance.ref().child(selectedfile.value);
  //     UploadTask uploadTask = storageReference.putFile(file);
  //     await uploadTask.whenComplete(() async {
  //        downloadURL(await storageReference.getDownloadURL());
  //        print("Image Downloaded Sucessfull --------${downloadURL}");
  //     });
  //   } catch (e) {
  //     // Handle error
  //   }
  //   return downloadURL;
  // }
  Future uploadImage() async {
    print("upload Image Process start---------------------------");
    filename(Uuid().v4());
    await FirebaseStorage.instance
        .ref(filename.value.toString())
        .putFile(File(selectedfile.value))
        .whenComplete(() {})
        .then((filedata) async {

       // print("image filedata -----------------------");
      await filedata.ref.getDownloadURL().then((fileurl) async {

        await FirebaseFirestore.instance.collection("UserDetail").doc(AppPreference.getString(AppConstant.userId)).update(
            {
              "profileUrl":fileurl,
            }).then((value) {
          print("This is File Url ----------------------"+fileurl+"-----------------------");
        });

        // print("image Uploaded -----------------------");
      });
    });
  }
}

//FirebaseFirestore.instance.collection('collectionName')
//   .doc('docID')
//   .set({
//   'field': 'value'
// },SetOptions(merge: true)).then((value){
//   //Do your stuff.
// });
