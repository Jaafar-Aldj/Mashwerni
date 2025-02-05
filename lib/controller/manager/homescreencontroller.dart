import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/settingscontroller.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/page/screen/manager/addtrip.dart';
import 'package:mashwerni/page/screen/profile.dart';
import 'package:mashwerni/page/screen/settings.dart';
import 'package:mashwerni/page/screen/mytrips.dart';

abstract class ManagerHomeScreenController extends GetxController {
  changePage(int i);
}

class ManagerHomeScreenControllerImp extends ManagerHomeScreenController {
  int currentPage = 3;
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
      "widget": AddTrip(),
      "title": "add trip".tr,
      "icon": Icons.rocket_outlined,
      "route": AppRoute.addTrip,
    },
    {
      "widget": MyTrips(),
      "title": "my trips".tr,
      "icon": Icons.rocket_launch_outlined,
      "route": AppRoute.myTrips,
    },
  ];

  @override
  changePage(int i) {
    if (currentPage == 0) {
      Get.delete<SettingsControllerImp>();
    }
    currentPage = i;
    update();
  }
}
