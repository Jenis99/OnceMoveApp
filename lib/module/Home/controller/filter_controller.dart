import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled/util/color_resources.dart';

class FilterController extends GetxController {
  RxString selectedItem = "Easy Run".obs;
  RxString selectedItem2 = "full assistance".obs;
  RxString tFormatDropDownValue = "".obs;
  // RxList tPlayerDropDownList = [].obs;
  // RxString runDropdownValue = 'Easy Run'.obs;
  // RxString supportDropdown = 'full assistance'.obs;

  final supportNeeded = [
    'full assistance',
    'little assistance'
  ];

  final typeOfHour = [
    'Easy Run',
    'Long Run',
    'Intervals',
    'Race'
  ];

  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownMenuItems {
    return typeOfHour.map((String option) {
      return DropdownMenuItem<String>(
        value: option,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option),
        Container(
          height: 15.0.h,
          width: 15.0.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
              (selectedItem.value == option)
                  ? Color(0xff1059BC)
                  : Color(0xffB7B7B7)),
        )
          ],
        ),
      );
    }).toList();
  }


  List<DropdownMenuItem<String>> get secondDropdownMenuItems {
      return supportNeeded.map((String option) {
      return DropdownMenuItem<String>(
        value: option,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option),
            Container(
              height: 15.0.h,
              width: 15.0.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color:
                      ColorRes.primaryColor),
                  color:
                  (selectedItem2.value == option)
                      ? ColorRes.primaryColor
                      : ColorRes.whiteColor),
            )
          ],
        ),
      );
    }).toList();
  }

  get context => null;

  void onItemSelect(value) {
    selectedItem.value = value;
  }

  void onSecondItemSelect(value) {
    selectedItem2.value = value;
  }

  PickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //get today's date
        firstDate: DateTime(2000),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      print(
          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('dd-MM-yyyy')
          .format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(
          formattedDate);
      dateInput.text =
          formattedDate;
    }
    else {
      print("Date is not selected");
    }
  }

  TimePick() async {
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
  }
}