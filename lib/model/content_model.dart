import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/image_resources.dart';

class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent({required this.image,required this.title,required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
      title: AppString.onBordIngLorem,
      image: ImageRes.onBoarding,
      discription: AppString.lorem
  ),
  OnbordingContent(
      title: AppString.onBordIngLorem,
      image: ImageRes.onBoarding,
      discription: AppString.lorem
  ),
  OnbordingContent(
      title: AppString.onBordIngLorem,
      image: ImageRes.onBoarding,
      discription: AppString.lorem
  ),
];