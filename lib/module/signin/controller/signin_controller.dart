
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';

class SignInController extends GetxController{

  // RxBool passwordVisible=false.obs;

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  final signInFormKey = GlobalKey<FormState>();

  SignIn()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:email.text.toString(),
        password:password.text.toString(),
      );
      Get.toNamed(Routes.bottomNavBarScreen);
      // User signed in successfully
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        AppToast.toastMessage("Please Enter right password");
      } else {
        AppToast.toastMessage(e.code.toString());
      }
    } catch (e) {
      print(" Handle other errors which is not definded");
    }
  }
}