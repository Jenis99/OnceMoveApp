import 'package:untitled/util/image_resources.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image,required this.title,required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Lorem ipsum dolor sit 1',
      image: ImageRes.onBoarding,
      discription: "Posuere fringilla adipiscing tincidunt viverra nisi "
          "massa enim vestibulum. Eget amet enim nisi sit "
          "turpis tincidunt sit.i."
  ),
  UnbordingContent(
      title: 'Lorem ipsum dolor sit 2',
      image: ImageRes.onBoarding,
      discription: "Posuere fringilla adipiscing tincidunt viverra nisi "
          "massa enim vestibulum. Eget amet enim nisi sit "
          "turpis tincidunt sit.i."
  ),
  UnbordingContent(
      title: 'Lorem ipsum dolor sit 3',
      image: ImageRes.onBoarding,
      discription: "Posuere fringilla adipiscing tincidunt viverra nisi "
          "massa enim vestibulum. Eget amet enim nisi sit "
          "turpis tincidunt sit.i."
  ),
];