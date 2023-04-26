import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/routes.dart';

class SplashController extends GetxController{



  @override
  void onInit() async{
    super.onInit();
    await Future.delayed(
        const Duration(seconds: 5),
    () => openScreen(),);
  }

  void openScreen() async {
    await Future.delayed(
      const Duration(seconds: 5),
      );

    // SharedPreferences prefs=await SharedPreferences.getInstance();
    //  bool islogin =await prefs.getBool("")??false;

    if(AppPreference.getBoolean(AppString.isLogin)){
      Get.toNamed(Routes.bottomNavBarScreen);
    }
    else{
      Get.offAndToNamed(Routes.onBoarding);
    }
    // print('AppSharedPreference.accessToken()-->${AppSharedPreference.accessToken()}');
    // AppSharedPreference.accessToken().isEmpty ? Get.offAndToNamed(Routes.loginScreen) : Get.offAndToNamed(Routes.home);
  }

}