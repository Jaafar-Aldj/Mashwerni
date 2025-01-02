import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/onboardingcontroller.dart';
import 'package:mashwerni/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChange(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            onBoardingList[i].image!,
            width: MediaQuery.of(context).size.width,
            height: Get.width / 1.3,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(height: 15),
          Text(
            onBoardingList[i].title!,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 10),
          Text(
            onBoardingList[i].body!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
