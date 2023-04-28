import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module/profile/controller/user_profile_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/custom_profile_options.dart';
import 'package:untitled/util/custom_widget/custom_network_image.dart';
import 'package:untitled/util/custom_widget/customhead_text.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  UserProfileController profileController = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Column(
                children: [
                  CustomNetworkImage(
                    image: AppPreference.getString(AppString.userProfileUrl),
                    height: 120.h,
                    width: 120.w,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  AppText(
                    text: AppPreference.getString(AppString.userEmail),
                    fontSize: 22.sp,
                    fontFamily: AppString.fontInter,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 33.h,
            ),
            ProfilOption(
              imgIcon: IconRes.followingIcon,
              text: AppString.following,
              onTap: (){},
            ),
            SizedBox(
              height: 21.h,
            ),
            ProfilOption(
              imgIcon: IconRes.settingIcon,
              text: AppString.setting,
              onTap: (){},
            ),
            SizedBox(
              height: 21.h,
            ),
            ProfilOption(
              imgIcon: IconRes.privacyPolicyIcon,
              text: AppString.privacyPolicy,
              onTap: (){},
            ),
            SizedBox(
              height: 21.h,
            ),
            ProfilOption(
              imgIcon: IconRes.termsOfUseIcon,
              text: AppString.termsOfUse,
              onTap: (){},
            ),
            SizedBox(
              height: 21.h,
            ),
            ProfilOption(
              imgIcon: IconRes.helpIcon,
              text: AppString.helpCenter,
              onTap: (){},
            ),
            SizedBox(
              height: 21.h,
            ),
            ProfilOption(
              imgIcon: IconRes.logOutIcon,
              text: AppString.logout,
              onTap: (){
                AlertDialog alert = AlertDialog(
                  title: Text(AppString.logout),
                  content: Text(AppString.areYouSure),
                  actions: [
                    TextButton(
                        onPressed: () {
                          profileController.LogOut();
                        },
                        child: Text(AppString.logout)),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(AppString.cancle)),
                  ],
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
            ),
            // Center(
            //   child: GestureDetector(
            //       onTap: () {
            //         AlertDialog alert = AlertDialog(
            //           title: Text(AppString.logout),
            //           content: Text(AppString.areYouSure),
            //           actions: [
            //             TextButton(
            //                 onPressed: () {
            //                   profileController.LogOut();
            //                 },
            //                 child: Text(AppString.logout)),
            //             TextButton(
            //                 onPressed: () {
            //                   Get.back();
            //                 },
            //                 child: Text(AppString.cancle)),
            //           ],
            //         );
            //         showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return alert;
            //           },
            //         );
            //       },
            //       child: Text(
            //         "Log Out",
            //         style: TextStyle(fontSize: 30.sp, color: Colors.red),
            //       )),
            // )
          ],
        ),
      ),
    ));
  }
}
