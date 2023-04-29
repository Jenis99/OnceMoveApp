import 'package:get/get.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/routes.dart';

class SplashController extends GetxController{



  @override
  void onInit() async{
    super.onInit();
    await Future.delayed(
        const Duration(seconds: 2),
    () => openScreen(),);
  }

  void openScreen() async {

    if(AppPreference.getFirstTimeBoolean(AppString.onBoardingValue)){
      Get.offAndToNamed(Routes.onBoarding);
    }
    else
    {
      if(AppPreference.getBoolean(AppString.isLogin)){
        Get.offAndToNamed(Routes.bottomNavBarScreen);
      }
      else {
        Get.offAndToNamed(Routes.accountType);
      }
    }
  }

}