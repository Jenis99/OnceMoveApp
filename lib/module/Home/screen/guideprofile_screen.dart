import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/util/CustomWidget/custom_button.dart';
import 'package:untitled/util/CustomWidget/custom_network_image.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/CustomWidget/star_display.dart';
import 'package:untitled/util/CustomWidget/unordered_list.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:untitled/util/image_resources.dart';

class GuideProfileScreen extends StatefulWidget {
  @override
  State<GuideProfileScreen> createState() => _GuideProfileScreenState();
}

class _GuideProfileScreenState extends State<GuideProfileScreen> {
  var data;
  RxBool isfollowed = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets
                  .only(left: 20.0, right: 20.0)
                  .w,
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
                        CircleAvatar(
                          radius: 80.r,
                          backgroundImage: NetworkImage(
                            data["networkImage"] ?? ImageRes.fifthGuiderImage,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(data["name"] ?? "John"),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "10",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: AppString.fontPoppins),
                                ),
                                Text(
                                  "Clients",
                                  style: TextStyle(
                                    fontFamily: AppString.fontPoppins,
                                    fontSize: 18.sp,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 60.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  "1095",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: AppString.fontPoppins),
                                ),
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                    fontFamily: AppString.fontPoppins,
                                    fontSize: 18.sp,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Obx(
                        () =>
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: (isfollowed == false) ? CustomButton(
                                  onTap: () {
                                    isfollowed.value = !isfollowed.value;
                                  }, text: AppString.follow) :
                              CustomButton(onTap: (){
                                isfollowed.value = !isfollowed.value;
                              }, text: AppString.unfollow,
                                borderColor: ColorRes.primaryColor,
                                color: ColorRes.backGroundColor,
                                textColor: ColorRes.primaryColor,),
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
                  Text(
                    AppString.age,
                    style: TextStyle(
                        fontSize: 20.sp, fontFamily: AppString.fontPoppins),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(AppString.years),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppString.about,
                    style: TextStyle(
                        fontSize: 20.sp, fontFamily: AppString.fontPoppins),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10).r,
                    child: Text(
                      AppString.aboutLorem,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorRes.greyText,
                          fontFamily: AppString.fontPoppins),
                    ),
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
                            AppString.services,
                            style: TextStyle(
                                fontSize: 20.sp, fontFamily: AppString
                                .fontPoppins),
                          ),
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
                        padding: EdgeInsets
                            .only(right: 23)
                            .w,
                        child: Column(
                          children: [
                            Text(
                              AppString.experience,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: AppString.fontPoppins),
                            ),
                            Text(
                              AppString.oneYear,
                              style: TextStyle(
                                  fontFamily: AppString.fontPoppins,
                                  fontSize: 18.sp,
                                  color: ColorRes.greyText),
                            )
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
