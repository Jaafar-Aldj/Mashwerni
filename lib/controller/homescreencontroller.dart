import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homecontroller.dart';
import 'package:mashwerni/controller/myfavoritecontroller.dart';
import 'package:mashwerni/controller/settingscontroller.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/page/screen/home.dart';
import 'package:mashwerni/page/screen/myfavorite.dart';
import 'package:mashwerni/page/screen/profile.dart';
import 'package:mashwerni/page/screen/settings.dart';
import 'package:mashwerni/page/screen/mytrips.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 4;
  List<Map<String, dynamic>> listPage = [
    {
      "widget": Settings(),
      "title": "settings".tr,
      "icon": Icons.settings_outlined,
      "route": AppRoute.settings,
    },
    {
      "widget": Profile(),
      "title": "profile".tr,
      "icon": Icons.person_outline,
      "route": AppRoute.profile,
    },
    {
      "widget": MyFavorite(),
      "title": "favorite".tr,
      "icon": Icons.favorite_outline,
      "route": AppRoute.myFavorite,
    },
    {
      "widget": MyTrips(),
      "title": "my trips".tr,
      "icon": Icons.rocket_launch_outlined,
      "route": AppRoute.myTrips,
    },
    {
      "widget": Home(),
      "title": "home".tr,
      "icon": Icons.home_outlined,
      "route": AppRoute.home,
    },
  ];

  @override
  changePage(int i) {
    if (currentPage == 0) {
      Get.delete<SettingsControllerImp>();
    } else if (currentPage == 2) {
      Get.delete<MyFavoriteControllerImp>();
    } else if (currentPage == 4) {
      Get.delete<HomeControllerImp>();
    }
    currentPage = i;
    update();
  }
}
