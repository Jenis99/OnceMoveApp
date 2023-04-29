import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module/profile/controller/user_profile_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_profile_options.dart';
import 'package:untitled/util/custom_widget/custom_network_image.dart';
import 'package:untitled/util/custom_widget/customhead_text.dart';
import 'package:untitled/util/helper/app_preferences.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/image_resources.dart';

class ProfileScreen extends StatelessWidget {
  UserProfileController userProfileController =
      Get.put(UserProfileController());

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
                  Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 120.h,
                        width: 120.w,
                        child: Obx(
                              () => (userProfileController.isLoading.value)
                              ? SizedBox(
                            child: CircularProgressIndicator(
                              color: ColorRes.primaryColor,
                            ),
                          ): CustomNetworkImage(
                                height: 120.h,
                              width: 120.w,
                              image: (userProfileController
                                  .downloadURL.isEmpty)
                                  ? AppPreference.getString(
                                  AppString.userProfileUrl)
                                  : userProfileController.downloadURL.value),
                          //         Container(
                          //     width: 120.h,
                          //     height: 120.h,
                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       image: userProfileController.selectedfile.isEmpty
                          //           ?  DecorationImage(
                          //           fit: BoxFit.cover,
                          //           image: (CustomNetworkImage(
                          //             AppPreference.getString(AppString.userProfileUrl),
                          //           )))
                          //           : DecorationImage(
                          //         fit: BoxFit.cover,
                          //         image: FileImage(
                          //           File(userProfileController
                          //               .selectedfile.value ??
                          //               ""),
                          //         ),
                          //       ),
                          //     )
                          // ),
                        ),
                      ),
                      // Obx(
                      //   () => (userProfileController.isLoading.value)
                      //       ? SizedBox(
                      //     height: 120.h,
                      //     width: 120.w,
                      //     child: CircularProgressIndicator(
                      //             color: ColorRes.primaryColor,
                      //           ),
                      //       )
                      //       : CustomNetworkImage(
                      //           height: 120.h,
                      //           width: 120.w,
                      //           image: (userProfileController
                      //                   .selectedfile.isEmpty)
                      //               ? AppPreference.getString(
                      //                   AppString.userProfileUrl)
                      //               : userProfileController.downloadURL.value),
                      //   //         Container(
                      //   //     width: 120.h,
                      //   //     height: 120.h,
                      //   //     decoration: BoxDecoration(
                      //   //       shape: BoxShape.circle,
                      //   //       image: userProfileController.selectedfile.isEmpty
                      //   //           ?  DecorationImage(
                      //   //           fit: BoxFit.cover,
                      //   //           image: (CustomNetworkImage(
                      //   //             AppPreference.getString(AppString.userProfileUrl),
                      //   //           )))
                      //   //           : DecorationImage(
                      //   //         fit: BoxFit.cover,
                      //   //         image: FileImage(
                      //   //           File(userProfileController
                      //   //               .selectedfile.value ??
                      //   //               ""),
                      //   //         ),
                      //   //       ),
                      //   //     )
                      //   // ),
                      // ),
                      // Image.file(profileController.selectedfile!)),
                      Positioned(
                        bottom: 1,
                        right: 8,
                        child: GestureDetector(
                          onTap: () async {
                            AlertDialog alert = AlertDialog(
                              title: AppText(text: AppString.selectImg),
                              content: AppText(text: AppString.selectImgFrom),
                              actions: [
                                IconButton(
                                    onPressed: () async {
                                      Get.back();
                                      userProfileController.pickCameraImage();
                                    },
                                    icon: const Icon(Icons.camera)),
                                IconButton(
                                    onPressed: () async {
                                      Get.back();
                                      userProfileController.pickGalleryImage();
                                    },
                                    icon: const Icon(Icons.image))
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          child: Image.asset(
                            ImageRes.cameraImg,
                            height: 31.h,
                            width: 31.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // CustomNetworkImage(
                  //   image: AppPreference.getString(AppString.userProfileUrl),
                  //   height: 120.h,
                  //   width: 120.w,
                  // ),
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
              onTap: () {},
            ),
            SizedBox(
              height: 21.h,
            ),
            ProfilOption(
              imgIcon: IconRes.settingIcon,
              text: AppString.setting,
              onTap: () {},
            ),
            SizedBox(
              height: 21.h,
            ),
            ProfilOption(
              imgIcon: IconRes.privacyPolicyIcon,
              text: AppString.privacyPolicy,
              onTap: () {},
            ),
            SizedBox(
              height: 21.h,
            ),
            ProfilOption(
              imgIcon: IconRes.termsOfUseIcon,
              text: AppString.termsOfUse,
              onTap: () {},
            ),
            SizedBox(
              height: 21.h,
            ),
            ProfilOption(
              imgIcon: IconRes.helpIcon,
              text: AppString.helpCenter,
              onTap: () {},
            ),
            SizedBox(
              height: 21.h,
            ),
            ProfilOption(
              imgIcon: IconRes.logOutIcon,
              text: AppString.logout,
              onTap: () {
                AlertDialog alert = AlertDialog(
                  title: Text(AppString.logout),
                  content: Text(AppString.areYouSure),
                  actions: [
                    TextButton(
                        onPressed: () {
                          userProfileController.LogOut();
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
