import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/color_resources.dart';
import 'package:untitled/util/icon_resources.dart';

Widget dropDown({
  required RxString dropDownValue,
  required RxList dropDownList,
  required ValueChanged onChanged,
   Widget? child,
  String type = "",
  String text = "",
  double? height,
  double? width,
  Color? borderColor,
  Color? textColor,
  Color? iconColor,
  double? selectedFontSize,
  double? hintFontSize,
  bool? isExpanded,
}) {
  return Container(
    height: height  /*SizeUtils.verticalBlockSize * 6*/,
    width: width ?? double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0.r),
        color: ColorRes.whiteColor,
        border: Border.all(color: borderColor ??ColorRes.textBox)),
    child: Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Obx(
        () => DropdownButton(
          borderRadius: BorderRadius.circular(50.r),
            iconEnabledColor: ColorRes.blackColor,
            itemHeight: 50.0,
            icon: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Image.asset(
                IconRes.dropdownIcon,
                scale: 1,
                color: iconColor ?? ColorRes.textBox,
              ),
            ),
            dropdownColor: ColorRes.whiteColor,
            underline: Container(),
            hint: dropDownValue.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: AppText(
                      text: text,
                      fontSize: hintFontSize ?? 16.sp,
                      fontWeight: FontWeight.w400,
                      color: textColor ?? ColorRes.greyText,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top:  0),
                    child: AppText(
                      text: dropDownValue.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: selectedFontSize ?? 16.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorRes.blackColor,
                    ),
                  ),
            isExpanded: isExpanded ?? true,
            iconSize: 30.0,
            style: const TextStyle(fontSize: 11, color: ColorRes.blackColor),
            items: dropDownList.map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child:child ??
                      // AppText(
                      //   text: val,
                      //   fontSize: 14.sp,
                      //   fontWeight: FontWeight.w400,
                      //   // color: AppColors.textColor[300],
                      // ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text:val,
                            fontSize: 16.sp,
                          ),
                          Container(
                            height: 15.0.h,
                            width: 15.0.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (
                                    dropDownValue
                                        .value ==
                                        val)
                                    ? Color(0xff1059BC)
                                    : Color(0xffB7B7B7)),
                            child: ImageIcon(AssetImage(IconRes.sendDropdownIcon)),
                          )
                        ],
                      ),
                );
              },
            ).toList(),
            onChanged: onChanged),
      ),
    ),
  );
}
