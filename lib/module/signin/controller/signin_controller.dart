
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class SignInController extends GetxController{

  // RxBool passwordVisible=false.obs;

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  final signInFormKey = GlobalKey<FormState>();

}