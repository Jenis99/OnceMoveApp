import 'package:flutter/material.dart';
import 'package:untitled/module/onboarding_screen/onbording_screen.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';
import 'package:untitled/util/sizeutils.dart';


import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
  SplashController splashController=Get.put(SplashController());
  // SplashController spl =Get.put(SplashController());
  // checklogin() async {
  //   await Get.toNamed("/onboarding");
  // }

  @override
  Widget build(BuildContext context) {
    // SizeUtils().init(context);
    return Scaffold(
      body: Center(
        child: Image.asset(ImageRes.splashImg),
      ),
    );
  }
}
