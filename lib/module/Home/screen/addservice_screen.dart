import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:untitled/util/CustomWidget/custom_button.dart';
import 'package:untitled/util/CustomWidget/custom_textfiled.dart';
import 'package:untitled/util/CustomWidget/customhead_text.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/icon_resources.dart';
import 'package:untitled/util/image_resources.dart';
import 'package:get/get.dart';
import 'package:untitled/util/routes.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  var runDropdownValue = 'Easy Run';
  var supportDropdown = 'full assistance';
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=Get.arguments;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0).w,
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
                                      initialDate: DateTime.now(), //get today's date
                                      firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101)
                                  );
                                  if(pickedDate != null ){
                                    print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                                    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                    print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                    //You can format date as per your need

                                    setState(() {
                                      dateInput.text = formattedDate; //set foratted date to TextField value.
                                    });
                                  }else{
                                    print("Date is not selected");
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
                                    print("Time is not selected");
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
                      Container(
                          padding: EdgeInsets.only(left: 20.0.w,right: 20.0.w),
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
                              DropdownButtonFormField(
                                // itemHeight: 20.0,
                                //   isDense: true,
                                borderRadius: BorderRadius.circular(30.r),
                                icon: ImageIcon(AssetImage(IconRes.dropdownIcon),size: 10.0,),
                                // iconDisabledColor: selected,
                                decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
                                  fillColor: ColorRes.whiteColor,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: ColorRes.textBox),
                                    borderRadius: BorderRadius.circular(50.0.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: ColorRes.textBox),
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
                                ),
                                value: runDropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {

                                    runDropdownValue = newValue!;
                                  });
                                },
                                items: <String>['Easy Run', 'Long Run', 'Intervals', 'Race'].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            value,
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                          Container(
                                            height: 15.0.h,
                                            width: 15.0.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:(runDropdownValue==value)? Color(0xff1059BC):Color(0xffB7B7B7)
                                            ),
                                            child: ImageIcon(AssetImage(IconRes.sendDropdownIcon),size: 10.0,),
                                          )
                                          // (dropdownValue==value)?ImageIcon(AssetImage(IconRes.checkedDropdownIcon,),size: 30.0,):ImageIcon(AssetImage(IconRes.uncheckedDropdownIcon,),
                                        ],
                                      )
                                  );
                                }).toList(),
                              ),
                            ],
                          )
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 20.0.w,right: 20.0.w),
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
                              DropdownButtonFormField(
                                // itemHeight: 20.0,
                                //   isDense: true,
                                borderRadius: BorderRadius.circular(30.r),
                                icon: ImageIcon(AssetImage(IconRes.dropdownIcon),size: 10.0,),
                                decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
                                  fillColor: ColorRes.whiteColor,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: ColorRes.textBox),
                                    borderRadius: BorderRadius.circular(50.0.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: ColorRes.textBox),
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
                                ),
                                value: supportDropdown,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    supportDropdown = newValue!;
                                  });
                                },
                                items: <String>['full assistance','little assistance'].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            value,
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                          Container(
                                            height: 15.0.h,
                                            width: 15.0.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(color: ColorRes.primaryColor),
                                                color:(supportDropdown==value)? ColorRes.primaryColor:ColorRes.whiteColor
                                            ),

                                          )
                                        ],
                                      )
                                  );
                                }).toList(),
                              ),
                            ],
                          )
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
                                "networkImage":data["networkImage"],
                                "name":data["name"],
                                "distance":data["distance"],
                              }
                              );
                            },
                            text: AppString.confirm),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
