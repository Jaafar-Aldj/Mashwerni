import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/page/screen/home.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 4;
  List<Widget> listPage = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Settings"),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Profile"),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Favorite"),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Trips"),
        ),
      ],
    ),
    Home(),
  ];
  List<String> listTitleBottomAppBar = [
    "settings".tr,
    "profile".tr,
    "favorite".tr,
    "trips".tr,
  ];
  List<IconData> listIcon = [
    Icons.settings_outlined,
    Icons.person_outline,
    Icons.favorite_outline,
    Icons.rocket_launch_outlined,
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
