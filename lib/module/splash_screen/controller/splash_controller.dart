import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class SplashController extends GetxController{



  @override
  void onInit() async{
    super.onInit();
    await Future.delayed(
        const Duration(seconds: 5),
    () => Get.toNamed(Routes.onBoarding),);
  }

  void openScreen() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () => Get.toNamed(Routes.onBoarding),
    );
    // print('AppSharedPreference.accessToken()-->${AppSharedPreference.accessToken()}');
    // AppSharedPreference.accessToken().isEmpty ? Get.offAndToNamed(Routes.loginScreen) : Get.offAndToNamed(Routes.home);
  }

}