import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/module/signin/controller/createnew_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
import 'package:untitled/util/custom_widget/custom_button.dart';
import 'package:untitled/util/custom_widget/custom_textfiled.dart';
import 'package:untitled/util/custom_widget/customhead_text.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:untitled/util/validation_utils.dart';

class CreateNewPassword extends StatelessWidget {
  final NewPasswordController newPasswordController = Get.put(NewPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: newPasswordController.newPasswordFormKey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(
                      height: 78.67.h,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(ImageRes.backButton)),
                    SizedBox(
                      height: 21.67.h,
                    ),
                    CustomHeadText(name: AppString.createNewPassword),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppText(
                      text: AppString.enterNewPassword,
                      fontSize: 16.sp,
                      color: ColorRes.greyText,
                    ),
                    SizedBox(
                      height: 30.0.h,
                    ),
                    CustomTextfield(
                      name: AppString.password,
                      isPassword: true,
                      controller: newPasswordController.password,
                      keyType: TextInputType.visiblePassword,
                      hintText: "---",
                      validator: AppValidator.passwordValidation,
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    CustomTextfield(
                      name: AppString.confirmPassword,
                      isPassword: true,
                      controller: newPasswordController.confirm,
                      keyType: TextInputType.visiblePassword,
                      hintText: "----",
                      validator: AppValidator.passwordValidation,
                    )
                  ]),
                ),
              ),
              CustomButton(
                  text: AppString.done,
                  isLoading: newPasswordController.isLoading.value,
                  onTap: () {
                    if (newPasswordController.newPasswordFormKey.currentState!.validate()) {
                      if (newPasswordController.password.text == newPasswordController.confirm.text) {
                        newPasswordController.setPassword();
                      } else {
                        AppSnackBar(title: AppString.error, subtitle: AppString.passwordNotMatch);
                      }
                    }
                  })
            ],
          )),
    );
  }
}
