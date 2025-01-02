import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/onboardingcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/data/datasource/static/static.dart';

class CustomDotOnboarding extends StatelessWidget {
  const CustomDotOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: EdgeInsets.only(right: 5),
              duration: Duration(milliseconds: 900),
              width: 15,
              height: 6,
              decoration: BoxDecoration(
                color: controller.currentPage == index
                    ? AppColor.primary
                    : AppColor.lightPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
