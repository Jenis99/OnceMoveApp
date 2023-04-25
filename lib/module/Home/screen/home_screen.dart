import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module/Home/controller/home_controller.dart';
import 'package:untitled/util/CustomWidget/custom_network_image.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/app_string.dart';
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
              padding: const EdgeInsets.only(left: 20.0, right: 20.0).w,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomHeadText(
                        name: AppString.home,
                      ),
                       Image.asset(IconRes.bellIcon)
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon:
                                ImageIcon(AssetImage(IconRes.searchIcon)),
                            hintText: AppString.search,
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: AppString.fontPoppins,
                            ),
                            filled: true,
                            contentPadding: const EdgeInsets.only(
                                    top: 12.0,
                                    left: 13.0,
                                    bottom: 12.0,
                                    right: 50.0)
                                .w,
                            fillColor: ColorRes.whiteColor,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: ColorRes.textBox),
                              borderRadius: BorderRadius.circular(50.0.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: ColorRes.textBox),
                              borderRadius: BorderRadius.circular(50.0.r),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                              borderSide: const BorderSide(
                                color: ColorRes.textBox,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                              borderSide: const BorderSide(
                                color: ColorRes.textBox,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                              borderSide: const BorderSide(
                                color: ColorRes.textBox,
                              ),
                            ),
                            // errorBorder: OutlineInputBorder( //<-- SEE HERE
                            //   borderSide:const  BorderSide(
                            //       color: Colors.redAccent),
                            //   borderRadius: BorderRadius.circular(50.0.r),
                          ),
                          keyboardType: TextInputType.text,
                          controller: homeController.searchController,
                        ),
                      ),
                      GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.filerScreen);
                          },
                          child:Image.asset(IconRes.filterIcon)),
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
                                      Text(
                                        homeController
                                            .imageModel[index].distance
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontFamily: AppString.fontInter),
                                      ),
                                      Text(
                                        homeController.imageModel[index].name
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 23.sp,
                                            fontFamily: AppString.fontInter),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      );
                    },
                    // Container(
                    //   height: 100.0.h,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30.0.r),
                    //     color: Colors.red,
                    //   ),
                    // )
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
