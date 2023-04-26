import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module/Profile/controller/profile_controller.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/helper/toast_helper.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class ProfileScreen extends StatelessWidget {
  ProfileController profileController=Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
      children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomHeadText(
                name: AppString.profile,
              ),
              Image.asset(IconRes.bellIcon)
            ],
          ),
          Center(
            child: GestureDetector(
                onTap: (){
                  AlertDialog alert = AlertDialog(
                    title:  Text(AppString.logout),
                    content: Text(AppString.areYouSure),
                    actions: [
                      TextButton(onPressed: (){
                       profileController.LogOut();
                      }, child: Text(AppString.logout)),

                      TextButton(onPressed: (){
                        Get.back();
                      }, child: Text(AppString.cancle)),
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                child: Text("Log Out",style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.red
                ),)),
          )
      ],
    ),
        ));
  }
}
