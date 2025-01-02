import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/onboardingcontroller.dart';
import 'package:mashwerni/page/widget/onboarding/custombutton.dart';
import 'package:mashwerni/page/widget/onboarding/customslider.dart';
import 'package:mashwerni/page/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: CustomButtonOnBoarding(),
      body: SafeArea(
        minimum: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomDotOnboarding(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
