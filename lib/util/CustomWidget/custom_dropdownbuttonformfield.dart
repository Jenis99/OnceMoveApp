import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/icon_resources.dart';

class CustomDropdownButtonFormField extends StatelessWidget {

  Value? value;
  ValueChanged? onChanged;
  List<DropdownMenuItem> items;
  String? hintText;

  CustomDropdownButtonFormField(
      {this.value, this.onChanged, required this.items, this.hintText});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      // itemHeight: 20.0,
      //   isDense: true,
        borderRadius: BorderRadius.circular(30.r),
        // iconDisabledColor: selected,
        icon: ImageIcon(
          AssetImage(IconRes.dropdownIcon),
          size: 10.0,
        ),
        decoration: InputDecoration(
          filled: true,
          hintText:hintText ,
          contentPadding: EdgeInsets.symmetric(
              vertical: 10.w, horizontal: 20.w),
          fillColor: ColorRes.whiteColor,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: ColorRes.textBox),
            borderRadius: BorderRadius.circular(50.0.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: ColorRes.textBox),
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
        value: value,
        onChanged: onChanged,
        items: items
    );
  }
}
