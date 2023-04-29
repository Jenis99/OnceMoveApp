import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/custom_widget/app_snackbar.dart';
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
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  RxString selectedRun = "".obs;
  RxString selectedSupport = "".obs;
  RxList supportNeededList = ['full assistance', 'little assistance'].obs;

  RxList typeOfHourList = ['Easy Run', 'Long Run', 'Intervals', 'Race'].obs;
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
                  child: Column(
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
                                  controller: dateInput,
                                  name: AppString.date,
                                  hintText: AppString.dateFormat,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        //get today's date
                                        firstDate: DateTime(2000),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101)
                                    );
                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                      String formattedDate = DateFormat(
                                          'dd-MM-yyyy').format(
                                          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2022-07-04
                                      //You can format date as per your need

                                      setState(() {
                                        dateInput.text =
                                            formattedDate; //set foratted date to TextField value.
                                      });
                                    } else {
                                      AppSnackBar(title: AppString.error, subtitle: AppString.dateIsNotSelected);
                                    }
                                  },
                                )),
                            SizedBox(
                              width: 30.w,
                            ),
                            Expanded(
                                child: CustomTextfield(
                                  name: AppString.time,
                                  hintText: AppString.timeFormate,
                                  controller: timeInput,
                                  onTap: () async {
                                    TimeOfDay? pickedTime = await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );
                                    if (pickedTime != null) {
                                      timeInput.text = pickedTime
                                          .format(context)
                                          .toString(); //set the value of text field.
                                    } else {
                                      AppSnackBar(title: AppString.error, subtitle: AppString.timeIsNotSelected);
                                    }
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
                    height: 19.h,
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
                          Get.toNamed(Routes.cancelRequestScreen,
                              arguments: {
                                "networkImage": data["networkImage"],
                                "name": data["name"],
                                "distance": data["distance"],
                              }
                          );
                        },
                        text: AppString.confirm),
                  ),
                  ]
                ),
              ),
            ),);
          }),
        ),
      ),
    );
  }
}
