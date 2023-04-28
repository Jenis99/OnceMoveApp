import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/icon_resources.dart';
class CustomDropDown extends StatelessWidget {
  final value;
  var name;
  final List<String> itemsList;
  final Color? dropdownColor;
  final Widget? child;
  final Function(dynamic value) onChanged;

   CustomDropDown({
    required this.name,
    required this.value,
    required this.child,
    required this.itemsList,
    this.dropdownColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
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
          value: value,
          onChanged:onChanged,
          items: itemsList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: child ?? Text(
                value,
                style: TextStyle(fontSize: 16.sp),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}