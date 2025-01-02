import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/onboardingcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/data/datasource/static/static.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      onTap: () {
        controller.next();
      },
      child: GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Icon(
          color: AppColor.primary,
          size: 50,
          controller.currentPage == (onBoardingList.length - 1)
              ? Icons.check_circle_rounded
              : Icons.arrow_circle_right_rounded,
        ),
      ),
    );
  }
}
