import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/module/Home/controller/filter_controller.dart';
import 'package:untitled/util/CustomWidget/custom_button.dart';
import 'package:untitled/util/CustomWidget/custom_dropdown.dart';
import 'package:untitled/util/CustomWidget/custom_textfiled.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:untitled/util/image_resources.dart';

class FilterScreen extends StatelessWidget {
  FilterController filterController = Get.put(FilterController());

  RxString tFormatDropDownValue = "".obs;
  RxList tPlayerDropDownList = ['full assistance', 'little assistance'].obs;
  RxString selectedRun = "".obs;
  RxString selectedSupport = "".obs;
  RxList supportNeededList = ['full assistance', 'little assistance'].obs;

  RxList typeOfHourList = ['Easy Run', 'Long Run', 'Intervals', 'Race'].obs;

  @override
  Widget build(BuildContext context) {
    var selected;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
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
                          CustomHeadText(name: AppString.filter),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      AppText(text:AppString.findGuide),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomTextfield(
                        name: AppString.location,
                        hintText: AppString.address,
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: CustomTextfield(
                            controller: filterController.dateInput,
                            name: AppString.date,
                            hintText: AppString.dateFormat,
                            onTap: () async {
                              filterController.PickDate(context: context);
                            },
                          )),
                          SizedBox(
                            width: 30.w,
                          ),
                          Expanded(
                              child: CustomTextfield(
                            name: AppString.time,
                            hintText: AppString.timeFormate,
                            controller: filterController.timeInput,
                            onTap: () async {
                              filterController.TimePick(context: context);
                            },
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      CustomTextfield(
                        name: AppString.note,
                        hintText: AppString.write,
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text:AppString.typeOfRun,
                                    fontSize: 18.sp,
                                    fontFamily: AppString.fontPoppins,
                                    color: ColorRes.textColor,
                                    fontWeight: FontWeight.w400
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 19.h,
                      ),
                      AppText(text: AppString.typeOfRun,
                        fontSize: 18.sp,
                        color: ColorRes.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      dropDown(
                        text: AppString.longLessHour,
                        dropDownValue: selectedRun,
                        dropDownList: typeOfHourList,
                        onChanged: (val) async {
                          selectedRun.value = val.toString();
                        },
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      AppText(text: AppString.supportNeeded,
                        fontSize: 18.sp,
                        color: ColorRes.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      dropDown(
                        text: AppString.selectOption,
                        dropDownValue: selectedSupport,
                        dropDownList: supportNeededList,
                        onChanged: (val) async {
                          selectedSupport.value = val.toString();
                        },
                      ),
                      // AppText(text: "this is Button",fontSize: 20.0,),
                      // dropDown(
                      //   borderColor: ColorRes.blackColor,
                      //   onChanged: (val) async {
                      //     tFormatDropDownValue.value = val.toString();
                      //   },
                      // // color: tFormatDropDownValue.value== val.toString()
                      // //     ? Colors.transparent
                      // //     : Colors.red,
                      //   dropDownList: tPlayerDropDownList,
                      //   dropDownValue: tFormatDropDownValue,
                      // ),
                      SizedBox(
                        height: 5.h,
                      ),
                      //

                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.w, horizontal: 20.w),
                        child:
                            CustomButton(onTap: () {}, text: AppString.search),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
