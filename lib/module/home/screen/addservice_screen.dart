import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module/Home/controller/filter_controller.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/custom_button.dart';
import 'package:untitled/util/custom_widget/custom_dropdown.dart';
import 'package:untitled/util/custom_widget/custom_textfiled.dart';
import 'package:untitled/util/custom_widget/customhead_text.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  FilterController filterController = Get.find();

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
          child: LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(children: [
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
                        CustomHeadText(name: AppString.bookingDetails),
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
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
                    AppText(
                      text: AppString.typeOfRun,
                      fontSize: 18.sp,
                      color: ColorRes.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    dropDown(
                      text: AppString.longLessHour,
                      dropDownValue: filterController.selectedRunType,
                      dropDownList: filterController.typeOfHourList,
                      onChanged: (val) async {
                        filterController.selectedRunType.value = val.toString();
                      },
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    AppText(
                      text: AppString.supportNeeded,
                      fontSize: 18.sp,
                      color: ColorRes.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    dropDown(
                      text: AppString.selectOption,
                      dropDownValue: filterController.selectedSupport,
                      dropDownList: filterController.supportList,
                      onChanged: (val) async {
                        filterController.selectedSupport.value = val.toString();
                      },
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: CustomButton(
                          height: 50.0,
                          onTap: () {
                            Get.toNamed(Routes.cancelRequestScreen, arguments: {
                              "networkImage": data["networkImage"],
                              "name": data["name"],
                              "distance": data["distance"],
                            });
                          },
                          text: AppString.confirm),
                    ),
                  ]),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
