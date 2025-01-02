import 'package:get/get.dart';
import 'package:mashwerni/core/constant/imageasset.dart';
import 'package:mashwerni/data/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "choose trip".tr,
      body: "choose the trip that you find most instersting".tr,
      image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "discover new things".tr,
      body:
          "explore new things through our app. Discover initiary & other stuffs"
              .tr,
      image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: "share your moments".tr,
      body:
          "share your trip initiary with others.let's make the travel fun & enjoyable"
              .tr,
      image: AppImageAsset.onBoardingImageThree),
];
