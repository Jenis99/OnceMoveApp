import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module/Home/controller/home_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/custom_network_image.dart';
import 'package:untitled/util/custom_widget/custom_textfiled.dart';
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
                    Image.asset(IconRes.bellIcon)
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                    SizedBox(
                      height: 20.h,
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
                    StreamBuilder(stream: FirebaseFirestore.instance.collection('UserDetail').where("email",isNotEqualTo: homeController.userEmail.value).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(snapshot.hasData){
                          if(snapshot.data!.size<0){
                            return Center(
                              child: AppText(text: AppString.noData),
                            );
                          }
                          else{
                            return GridView.builder(
                              primary: false,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.size,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 20.r,
                                  mainAxisSpacing: 20.0.r,
                                  crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.requestGuideScreen,
                                      arguments: {
                                        "networkImage":
                                        snapshot.data!.docs[index]["profileUrl"],
                                        "name": snapshot.data!.docs[index]["username"],
                                        "distance":
                                        AppString.thirteenKmAway,
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
                                            image: snapshot.data!.docs[index]["profileUrl"],
                                            borderRadius: BorderRadius.circular(30.r),
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
                                                Padding(
                                                  padding:  EdgeInsets.only(top:5.0.h),
                                                  child: AppText(
                                                      text:AppString.thirteenKmAway,
                                                      fontSize: 18.sp,
                                                      fontFamily: AppString.fontInter
                                                  ),
                                                ),
                                                AppText(
                                                    text:snapshot.data!.docs[index]["username"]??"--",
                                                    fontSize: 21.sp,
                                                    fontFamily: AppString.fontInter
                                                ),
                                              ],
                                            ),
                                          )
                                        ]),
                                  ),
                                );
                              },
                            );
                          }
                        }
                        else{
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                    )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
