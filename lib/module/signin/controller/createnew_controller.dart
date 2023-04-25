import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController{

  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  final newPasswordFormKey = GlobalKey<FormState>();
}