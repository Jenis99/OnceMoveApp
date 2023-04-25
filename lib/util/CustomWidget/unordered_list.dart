import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/color_resources.dart';

class UnorderedListItem extends StatelessWidget {
  final String text;
  Color? color;
  double? fontSize;

  UnorderedListItem({required this.text, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "• ",
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: fontSize ?? 50.sp,
              color: color ?? ColorRes.primaryColor),
        ),
        // Container(
        //   alignment: Alignment.bottomCenter,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: ColorRes.primaryColor
        //   ),
        //   child: SizedBox(height: 10.0.h,width: 10.0.w,),
        // ),
        Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontFamily: AppString.fontPoppins,
            fontSize: fontSize ?? 18.sp,
          ),
        ),
      ],
    );
  }
}
