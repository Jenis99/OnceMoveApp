import 'package:untitled/util/app_string.dart';
import 'package:untitled/util/image_resources.dart';

class OnBoardingContent {
  String image;
  String title;
  String discription;

  OnBoardingContent({required this.image,required this.title,required this.discription});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: AppString.onBoardIngHeading,
      image: ImageRes.onBoarding,
      discription: AppString.onBoardingLorem
  ),
  OnBoardingContent(
      title: AppString.onBoardIngHeading,
      image: ImageRes.onBoarding,
      discription: AppString.onBoardingLorem
  ),
  OnBoardingContent(
      title: AppString.onBoardIngHeading,
      image: ImageRes.onBoarding,
      discription: AppString.onBoardingLorem
  ),
];