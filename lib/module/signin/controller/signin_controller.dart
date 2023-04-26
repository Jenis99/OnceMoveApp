import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/routes.dart';

class SignInController extends GetxController {
  // RxBool passwordVisible=false.obs;
  RxString enterEmail = "".obs;
  RxString enterPassword = "".obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  SignIn() async {
    print(email.text);
    await FirebaseFirestore.instance
        .collection("UserDetail")
        .where(
            /*"email",isEqualTo: email.text.toString()*/
            "email",
            isEqualTo: email.text.toLowerCase().trim(),)
        .get()
        .then((value) async {
     if(value.docs.isNotEmpty && value.docs.first.data()["password"]==password.text.trim()){


       Get.offAllNamed(Routes.bottomNavBarScreen);
       AppPreference.setBoolean(AppString.isLogin, value: true);


       // SharedPreferences prefs= await SharedPreferences.getInstance();
       // prefs.setString("islogin", "true");
     }
     else{
       AppToast.toastMessage(AppString.plsEnterPass);
     }
    });

    // await FirebaseFirestore.instance.collection("UserDetail").get().then((value){
    //   var data= value.docs;
    //   print("object----------------${data.length}---------");
    //   // enterEmail(data?["email"]);
    //   // print("${data?["email"]}------------------------------");
    //   // enterPassword(data?["password"]);
    //   if(enterEmail==email.text.toString()  &&  enterPassword.value==password.text.toString()){
    //
    //   }
    // });
  }
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email:email.text.toString(),
//       password:password.text.toString(),
//     );
//
//     Get.toNamed(Routes.bottomNavBarScreen);
//     // User signed in successfully
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//       AppToast.toastMessage("Please Enter right password");
//     } else {
//       AppToast.toastMessage(e.code.toString());
//     }
//   } catch (e) {
//     print(" Handle other errors which is not definded");
//   }
// }
}
