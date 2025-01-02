import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChange(int pageNum);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > (onBoardingList.length - 1)) {
      myServices.sharedPreferences.setString("onboarding", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChange(int pageNum) {
    currentPage = pageNum;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
