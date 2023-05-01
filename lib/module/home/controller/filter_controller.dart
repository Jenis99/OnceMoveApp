import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled/util/app_constant.dart';

class FilterController extends GetxController {
  RxString selectedRunType = "".obs;
  RxString selectedSupport = "".obs;

  // RxList supportNeededList=[AppConstant.filterSupportNeededList].obs;
  final RxList supportList = [AppConstant.filterSupportNeededList].obs;
  final RxList typeOfHourList = [AppConstant.filterTypesOfRunList].obs;

  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();

  PickDate({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      print(formattedDate);
      dateInput.text = formattedDate;
    } else {
      print("Date is not selected");
    }
  }

  TimePick({required BuildContext context}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (pickedTime != null) {
      timeInput.text = pickedTime.format(context).toString();
    } else {
      print("Time is not selected");
    }
  }
}
