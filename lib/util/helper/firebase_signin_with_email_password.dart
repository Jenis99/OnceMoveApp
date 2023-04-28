import 'package:firebase_auth/firebase_auth.dart';

Future SingIn()async{
    try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email:"your email",
      password:"your password",
    );
    //login successful
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      // AppToast.toastMessage("Please Enter right password");
    } else {
      // AppToast.toastMessage(e.code.toString());
    }
  } catch (e) {
    print(" Handle other errors which is not definded");
  }
}

Future SignUp()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:"your email",
        password: "your password",
      );
      // Get.toNamed(Routes.profileImage);
      // User signed up successfully
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // AppToast.toastMessage("this is weak password Please enter strong password");
      } else if (e.code == 'email-already-in-use') {
        // AppToast.toastMessage("This Email is Already LoggedIn");
        // print(" Handle email already in use error");
      } else {
        // AppToast.toastMessage(e.code.toString());
        print(e.code.toString());
      }
    } catch (e) {
      print(" Handle other errors");
    }
}

// This is for reset password
Future ResetEmail()async{
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(
        email: "your Email");
    //  Get.toNamed(Routes.enterOtp, arguments: {
    //   "email": "email",
    // }
  }
  on FirebaseAuthException catch (e) {
    print(e.code);
    print(e.message);
  }
}
