import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/custom_button.dart';
import 'package:untitled/util/custom_widget/custom_network_image.dart';
import 'package:untitled/util/custom_widget/customhead_text.dart';
import 'package:untitled/util/custom_widget/star_display.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class RequestGuideScreen extends StatefulWidget {
  @override
  State<RequestGuideScreen> createState() => _RequestGuideScreenState();
}

class _RequestGuideScreenState extends State<RequestGuideScreen> {
  var data;

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
      backgroundColor: ColorRes.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 34.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(ImageRes.backButton)),
                        CustomHeadText(name: AppString.guideDetail),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Column(
                      children: [
                        CustomNetworkImage(
                          image: data["networkImage"] ?? ImageRes.fifthGuiderImage,
                          width: 390.w,
                          height: 222.h,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: data["name"] ?? "John",
                                  fontSize: 22.sp,
                                ),
                                AppText(
                                    text: data["distance"] ?? "13 km away",
                                    fontSize: 19.sp,
                                    fontFamily: AppString.fontInter,
                                    color: ColorRes.greyText),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
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
                                )
                              ],
                            ),
                            Row(
                              children: [Image.asset(IconRes.msgIcon), Image.asset(IconRes.callIcon)],
                            )
                          ],
                        )
                      ],
                    ),
                    //Rating Bar
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0).w,
                      child: Text(
                        AppString.serviceDetail,
                        style: TextStyle(fontFamily: AppString.fontPoppins, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0).w,
                      child: Text(
                        AppString.serviceLorem,
                        style: TextStyle(fontSize: 16.sp, color: ColorRes.greyText),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppText(text: AppString.location, fontSize: 20.sp, fontFamily: AppString.fontPoppins),
                    SizedBox(
                      height: 8.h,
                    ),
                    AppText(text: AppString.address, fontSize: 14.sp, fontFamily: AppString.fontPoppins),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            AppText(
                              text: AppString.date,
                              fontFamily: AppString.fontPoppins,
                              fontSize: 20.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppText(text: AppString.dateFormat, fontSize: 14.sp, fontFamily: AppString.fontPoppins)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 70.0).w,
                          child: Column(
                            children: [
                              AppText(
                                text: AppString.time,
                                fontFamily: AppString.fontPoppins,
                                fontSize: 20.sp,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AppText(text: AppString.seventeen, fontSize: 14.sp, fontFamily: AppString.fontPoppins)
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppText(text: AppString.typeOfRun, fontSize: 20.sp, fontFamily: AppString.fontPoppins),
                    SizedBox(
                      height: 8.h,
                    ),
                    AppText(
                      text: AppString.longLessHour,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: CustomButton(
                    onTap: () {
                      Get.toNamed(Routes.addServiceScreen, arguments: {
                        "networkImage": data["networkImage"],
                        "name": data["name"],
                        "distance": data["distance"],
                      });
                    },
                    text: AppString.request),
              )
            ],
          ),
        ),
      ),
    );
  }
}
