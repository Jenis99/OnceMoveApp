import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var selectedItem = "".obs;

  void onItemSelect(String item) {
    selectedItem.value = item;
  }
}