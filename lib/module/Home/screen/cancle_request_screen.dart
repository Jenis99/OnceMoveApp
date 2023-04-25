import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/util/CustomWidget/custom_button.dart';
import 'package:untitled/util/CustomWidget/custom_network_image.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/CustomWidget/star_display.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:untitled/util/routes.dart';

class CancleRequestScreen extends StatefulWidget {
  @override
  State<CancleRequestScreen> createState() => _CancleRequestScreenState();
}

class _CancleRequestScreenState extends State<CancleRequestScreen> {

  var data;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      data =  Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0).w,
          child: Column(
            children: [
              Expanded(
                child: Column (
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
                    ), Column(
                        children: [
                          CustomNetworkImage(
                            image: data["networkImage"] ??
                                ImageRes.fifthGuiderImage,
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
                                  Text(
                                    data["name"] ??
                                        "John",
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                    ),
                                  ),
                                  Text(
                                    data["distance"] ?? "13 km away",
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        fontFamily: AppString.fontInter,
                                        color: ColorRes.greyText
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Row(
                                    children: [
                                      Text("4"),
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
                                children: [
                                  Image.asset(IconRes.msgIcon),
                                  Image.asset(IconRes.callIcon)
                                ],
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
                        style: TextStyle(
                            fontFamily: AppString.fontPoppins, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0).w,
                      child: Text(
                        AppString.serviceLorem,
                        style:
                        TextStyle(fontSize: 16.sp, color: ColorRes.greyText),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      AppString.location,
                      style: TextStyle(
                          fontSize: 20.sp, fontFamily: AppString.fontPoppins),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      AppString.address,
                      style: TextStyle(
                          fontSize: 14.sp, fontFamily: AppString.fontPoppins),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              AppString.date,
                              style: TextStyle(
                                fontFamily: AppString.fontPoppins,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "12/08/2022",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: AppString.fontPoppins),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 70.0).w,
                          child: Column(
                            children: [
                              Text(
                                AppString.time,
                                style: TextStyle(
                                  fontFamily: AppString.fontPoppins,
                                  fontSize: 20.sp,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "17:00",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: AppString.fontPoppins),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      AppString.typeOfRun,
                      style: TextStyle(
                          fontSize: 20.sp, fontFamily: AppString.fontPoppins),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      AppString.longLessHour,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
              CustomButton(
                  onTap: () {
                    Get.toNamed(Routes.guideProfileScreen,
                    arguments: {
                      "networkImage":data["networkImage"],
                      "name":data["name"],
                      "distance":data["distance"],
                    }
                    );
                  },
                text: AppString.cancelRequest,
                borderColor: ColorRes.primaryColor,
                color: ColorRes.backGroundColor,

                textColor: ColorRes.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
