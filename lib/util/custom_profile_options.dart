import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_text.dart';
import 'package:untitled/util/icon_resources.dart';

class ProfilOption extends StatelessWidget {
  String imgIcon;
  String text;
  String? icon;
  GestureTapCallback? onTap;


  ProfilOption({required this.imgIcon,required this.text, this.icon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(imgIcon,height: 27.h,width: 27.w,),
          // SizedBox(width: 13.w,),
          Padding(
            padding: EdgeInsets.only(left: 18.w),
            child: AppText(text: text,
              fontSize: 23.sp,
              fontWeight: FontWeight.w500,),
          ),
          Spacer(),
          Image.asset(icon ?? IconRes.profileOptionGoIcon,height: 24.h,width: 24.w,),
        ],
      ),
    );
  }
}
