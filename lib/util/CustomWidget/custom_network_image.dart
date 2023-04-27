import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/app_text.dart';

class CustomNetworkImage extends StatelessWidget {
  String image;
  double? width;
  double? height;

  CustomNetworkImage(
      {required this.image,
         this.width,
         this.height
      });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          image,
          width: width,
          height: height,
          errorBuilder: (context, error, stackTrace) =>
               Center(child: AppText(text:AppString.checkYourImgUrl)),
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          // loadingBuilder: (context, child, loadingProgress) =>const Center(child:  CircularProgressIndicator()),
        ));
  }
}
