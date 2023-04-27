import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';
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
        AppText(
          text:"• ",
          textAlign: TextAlign.justify,
              fontSize: fontSize ?? 50.sp,
              color: color ?? ColorRes.primaryColor
        ),
        AppText(
          text:text,
          textAlign: TextAlign.justify,
            fontFamily: AppString.fontPoppins,
            fontSize: fontSize ?? 18.sp,

        ),
      ],
    );
  }
}
