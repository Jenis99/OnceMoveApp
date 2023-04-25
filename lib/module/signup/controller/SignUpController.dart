import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class SignUpController extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();

  final signUpFormKey = GlobalKey<FormState>();
}