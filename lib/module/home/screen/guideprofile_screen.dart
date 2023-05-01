import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/module/home/controller/guidedetail_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/custom_button.dart';
import 'package:untitled/util/custom_widget/custom_network_image.dart';
import 'package:untitled/util/custom_widget/customhead_text.dart';
import 'package:untitled/util/custom_widget/star_display.dart';
import 'package:untitled/util/custom_widget/unordered_list.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:untitled/util/image_resources.dart';

class GuideProfileScreen extends StatefulWidget {
  @override
  State<GuideProfileScreen> createState() => _GuideProfileScreenState();
}

class _GuideProfileScreenState extends State<GuideProfileScreen> {
  var data;
  final GuideDetailController guideDetailController = Get.put(GuideDetailController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.arguments != null) {
      data = Get.arguments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(ImageRes.backButton)),
                  CustomHeadText(name: AppString.guideProfile),
                ],
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomNetworkImage(
                      image: data["networkImage"] ?? ImageRes.fifthGuiderImage,
                      width: 390.w,
                      height: 222.h,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    AppText(text: data["name"] ?? "John"),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: AppString.four,
                        ),
                        IconTheme(
                          data: IconThemeData(
                            color: Colors.amber,
                            size: 15,
                          ),
                          child: StarDisplay(value: 4),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            AppText(text: AppString.ten, fontSize: 18.sp, fontFamily: AppString.fontPoppins),
                            AppText(
                              text: AppString.clients,
                              fontFamily: AppString.fontPoppins,
                              fontSize: 18.sp,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 60.0,
                        ),
                        Column(
                          children: [
                            AppText(text: AppString.oneZeroNineFive, fontSize: 18.sp, fontFamily: AppString.fontPoppins),
                            AppText(
                              text: AppString.followers,
                              fontFamily: AppString.fontPoppins,
                              fontSize: 18.sp,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: (guideDetailController.isFollowed.value == false)
                          ? CustomButton(
                              onTap: () {
                                guideDetailController.isFollowed.value = !guideDetailController.isFollowed.value;
                              },
                              text: AppString.follow)
                          : CustomButton(
                              onTap: () {
                                guideDetailController.isFollowed.value = !guideDetailController.isFollowed.value;
                              },
                              text: AppString.unfollow,
                              borderColor: ColorRes.primaryColor,
                              color: ColorRes.backGroundColor,
                              textColor: ColorRes.primaryColor,
                            ),
                    ),
                    Row(
                      children: [
                        Image.asset(IconRes.callIcon),
                        Image.asset(IconRes.msgIcon),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              AppText(text: AppString.age, fontSize: 20.sp, fontFamily: AppString.fontPoppins),
              SizedBox(
                height: 10.h,
              ),
              Text(AppString.years),
              SizedBox(
                height: 20.h,
              ),
              AppText(text: AppString.about, fontSize: 20.sp, fontFamily: AppString.fontPoppins),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10).r,
                child: AppText(text: AppString.aboutLorem, fontSize: 16.sp, color: ColorRes.greyText, fontFamily: AppString.fontPoppins),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AppText(text: AppString.services, fontSize: 20.sp, fontFamily: AppString.fontPoppins),
                      UnorderedListItem(
                        text: AppString.walking,
                        fontSize: 16.sp,
                        color: ColorRes.greyText,
                      ),
                      UnorderedListItem(
                        text: AppString.running,
                        fontSize: 16.sp,
                        color: ColorRes.greyText,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 23).w,
                    child: Column(
                      children: [
                        AppText(text: AppString.experience, fontSize: 20.sp, fontFamily: AppString.fontPoppins),
                        AppText(text: AppString.oneYear, fontFamily: AppString.fontPoppins, fontSize: 18.sp, color: ColorRes.greyText)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
