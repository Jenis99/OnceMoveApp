import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';

class SignUpController extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();

  final signUpFormKey = GlobalKey<FormState>();


  Singup()async {
    if(password.text==confirm.text){
      await FirebaseFirestore.instance.collection("UserDetail").where("email",isEqualTo: email.text.trim()).get().then((value){

        if(value.docs.isEmpty){
          FirebaseFirestore.instance.collection("UserDetail").add({
            "email":email.text.toString(),
            "password":password.text.toString(),
          }).then((value) async {
            Get.toNamed(Routes.profileImage);
            AppToast.toastMessage(AppString.accCreateSuccess);
            AppPreference.setBoolean(AppString.isLogin, value: true);
          });;
        }
        else{
          AppToast.toastMessage("You Already Have Account!!");
        }
      });
    }
    else{
      AppToast.toastMessage(AppString.plsEnterSamePassword);
    }
  }
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email:email.text.toString(),
  //       password: password.text.toString(),
  //     );
  //     Get.toNamed(Routes.profileImage);
  //     // User signed up successfully
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       AppToast.toastMessage("this is weak password Please enter strong password");
  //     } else if (e.code == 'email-already-in-use') {
  //       AppToast.toastMessage("This Email is Already LoggedIn");
  //       // print(" Handle email already in use error");
  //     } else {
  //       AppToast.toastMessage(e.code.toString());
  //       print(e.code.toString());
  //     }
  //   } catch (e) {
  //     print(" Handle other errors");
  //   }
  // }
}