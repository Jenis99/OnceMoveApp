import 'package:get/get.dart';

class GuidetDetailController extends GetxController {
   var argumentData = {};
  // dynamic argumentData = Get.arguments;
  RxString imageFromHome="".obs;
  RxString nameFromHome="".obs;
  RxString distanceFromHome="".obs;

  @override
  void onInit() {
    if(Get.arguments != null){
      argumentData =  Get.arguments;
      getdata();
    }

    super.onInit();
  }
  getdata(){
    imageFromHome(argumentData["networkImage"]);
    nameFromHome(argumentData["name"]);
    distanceFromHome(argumentData["distance"]);
  }
}