import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/page/screen/home.dart';
import 'package:mashwerni/page/screen/myfavorite.dart';
import 'package:mashwerni/page/screen/profile.dart';
import 'package:mashwerni/page/screen/settings.dart';
import 'package:mashwerni/page/screen/trips.dart';

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
      "widget": Trips(),
      "title": "trips".tr,
      "icon": Icons.rocket_launch_outlined,
      "route": AppRoute.trips,
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
    currentPage = i;
    update();
  }
}
