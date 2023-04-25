import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/module/Home/controller/filter_controller.dart';
import 'package:untitled/util/CustomWidget/custom_button.dart';
import 'package:untitled/util/CustomWidget/custom_dropdownbuttonformfield.dart';
import 'package:untitled/util/CustomWidget/custom_textfiled.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:untitled/util/image_resources.dart';

class FilterScreen extends StatelessWidget {
   FilterController filterController = Get.put(FilterController());

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
                      Text(AppString.findGuide),
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
                              filterController.PickDate();
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
                              filterController.TimePick();
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
                              Text(
                                AppString.typeOfRun,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: AppString.fontPoppins,
                                    color: ColorRes.textColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Obx(() => CustomDropdownButtonFormField(
                                  hintText: "Long>1hour",
                                  onChanged: ( newValue) {
                                    filterController.onItemSelect(newValue);
                                  },
                                  items:filterController.dropdownMenuItems )),
                            ],
                          )),

                      SizedBox(
                        height: 19.h,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppString.supportNeeded,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: AppString.fontPoppins,
                                    color: ColorRes.textColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Obx(() => CustomDropdownButtonFormField(
                                  hintText: "select option",
                                  onChanged: ( newValue) {
                                    filterController.onSecondItemSelect(newValue);
                                  },
                                  items:filterController.secondDropdownMenuItems )),
                              // CustomDropdownButtonFormField(
                              //     value: filterController.selectedItem,
                              //     onChanged: (newValue) {
                              //       filterController.onSecondItemSelect(newValue);
                              //     },
                              //     child: Row(
                              //   mainAxisAlignment:
                              //   MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       value,
                              //       style: TextStyle(fontSize: 16.sp),
                              //     ),
                              //     Container(
                              //       height: 15.0.h,
                              //       width: 15.0.w,
                              //       decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           border: Border.all(
                              //               color:
                              //               ColorRes.primaryColor),
                              //           color:
                              //           (filterController.supportDropdown.value == value)
                              //               ? ColorRes.primaryColor
                              //               : ColorRes.whiteColor),
                              //     )
                              //   ],
                              // ), items: items)
                            ],
                          )),
                      SizedBox(
                        height: 6.h,
                      ),
                      // dropDown(
                      //
                      //   onChanged: (val) async {
                      //     tFormatDropDownValue.value = val.toString();
                      //   },
                        // color: tFormatDropDownValue.value== val.toString()
                        //     ? Colors.transparent
                        //     : Colors.red,
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
