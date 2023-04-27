import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled/util/color_resources.dart';

class FilterController extends GetxController {
  RxString selectedItem = "".obs;
  RxString selectedItem2 = "Dog".obs;
  RxList supportNeeded = [
    'full assistance',
    'little assistance'
  ].obs;

  RxList typeOfHour = [
    'Easy Run',
    'Long Run',
    'Intervals',
    'Race'
  ].obs;

  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();

  PickDate({required BuildContext context}) async {
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

  TimePick({required BuildContext context}) async {
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