import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module/Home/controller/home_controller.dart';
import 'package:untitled/util/CustomWidget/custom_network_image.dart';
import 'package:untitled/util/CustomWidget/custom_textfiled.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.backGroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => (homeController.userEmail.value.isNotEmpty)
                            ? Row(
                                children: [
                                  ClipRRect(
                                    child: CustomNetworkImage(
                                      image: homeController.userProfile.value,
                                      height: 32.h,
                                      width: 32.w,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  AppText(
                                      text: homeController.userEmail.value,
                                      fontSize: 20.sp),
                                ],
                              )
                            : CircularProgressIndicator(),
                      ),
                      // CustomHeadText(
                      //   name: AppString.home,
                      // ),
                      Image.asset(IconRes.bellIcon)
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextfield(
                          isPassword: false,

                          controller: homeController.searchController,
                          hintText: AppString.search,
                          prefixIcon: ImageIcon(AssetImage(IconRes.searchIcon)),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.filerScreen);
                          },
                          child: Image.asset(IconRes.filterIcon)),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: homeController.imageModel.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20.r,
                        mainAxisSpacing: 20.0,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Routes.requestGuideScreen,
                            arguments: {
                              "networkImage":
                                  homeController.imageModel[index].networkImage,
                              "name": homeController.imageModel[index].name,
                              "distance":
                                  homeController.imageModel[index].distance,
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0.r),
                            color: ColorRes.whiteColor,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomNetworkImage(
                                  image: homeController
                                      .imageModel[index].networkImage
                                      .toString(),
                                  width: 183.w,
                                  height: 140.h,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 19.0, top: 4)
                                          .w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text:homeController
                                            .imageModel[index].distance
                                            .toString(),
                                            fontSize: 20.sp,
                                            fontFamily: AppString.fontInter
                                      ),
                                      AppText(
                                        text:homeController.imageModel[index].name
                                            .toString(),
                                            fontSize: 23.sp,
                                            fontFamily: AppString.fontInter
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
