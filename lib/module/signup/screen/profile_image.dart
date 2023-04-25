import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module/signup/controller/profile_controller.dart';

import 'package:untitled/util/CustomWidget/custom_button.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/CustomWidget/unordered_list.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backGroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  CustomHeadText(name: "Add Profile Image"),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  Stack(
                    children: <Widget>[
                      Obx(
                        () => Container(
                          width: 120.h,
                          height: 120.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: profileController.selectedfile.isEmpty
                                ? const DecorationImage(
                                    image: (AssetImage(
                                    ImageRes.profileImg,
                                  )))
                                : DecorationImage(
                                    image: FileImage(
                                      File(profileController
                                              .selectedfile.value ??
                                          ""),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      // Image.file(profileController.selectedfile!)),
                      Positioned(
                        bottom: 1,
                        right: 4,
                        child: GestureDetector(
                          onTap: () async {
                            AlertDialog alert = AlertDialog(
                              title: const Text("My title"),
                              content: const Text("This is my message."),
                              actions: [
                                IconButton(
                                    onPressed: () async {
                                      Get.back();
                                      profileController.pickCameraImage();
                                    },
                                    icon: const Icon(Icons.camera)),
                                IconButton(
                                    onPressed: () async {
                                      Get.back();
                                      profileController.pickGalleryImage();
                                    },
                                    icon: const Icon(Icons.pin))
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          child: Image.asset(ImageRes.cameraImg),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0.h,
                  ),
                  UnorderedListItem(text: AppString.yourPhotoFirst),
                  UnorderedListItem(text: AppString.yourPhotoSecond),
                  UnorderedListItem(text: AppString.yourPhotoThird),
                  UnorderedListItem(text: AppString.yourPhotoFourth),
                ],
              ),
            ),
            CustomButton(
              onTap: () {
                Get.toNamed(Routes.chooseGuide);
              },
              text: AppString.continueSpelling,
            )
          ],
        ),
      ),
    );
  }
}
