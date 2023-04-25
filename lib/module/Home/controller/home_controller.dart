import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/model/image_model.dart';
import 'package:untitled/util/image_resources.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<ImageModel> imageModel = [
    ImageModel(
        networkImage: ImageRes.firstGuiderImage,
        distance: "13 Km Away ",
        name: "John Smith"
    ),
    ImageModel(
        networkImage: ImageRes.secondGuiderImage,
        distance: "13 Km Away ",
        name: "Miguel Farley"
    ),
    ImageModel(
        networkImage: ImageRes.thirdGuiderImage,
        distance: "13 Km Away ",
        name: "Isabelaa"
    ),
    ImageModel(
        networkImage: ImageRes.fourthGuiderImage,
        distance: "13 Km Away ",
        name: "Kamari Conley"
    ),
    ImageModel(
        networkImage: ImageRes.fifthGuiderImage,
        distance: "13 Km Away ",
        name: "Zoie Sims"
    ),
    ImageModel(
        networkImage: ImageRes.sixthGuiderImage,
        distance: "13 Km Away ",
        name: "Johnson"
    ),
    // ImageModel(networkImage: ,distance: ,name: ),
    // ImageModel(networkImage: ,distance: ,name: ),
    // ImageModel(networkImage: ,distance: ,name: ),
    // ImageModel(networkImage: ,distance: ,name: ),
    // ImageModel(networkImage: ,distance: ,name: ),
  ];
}
