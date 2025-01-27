import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/service/services.dart';

class MyMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "3") {
      return RouteSettings(name: AppRoute.homeScreen);
    }
    if (myServices.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: AppRoute.userOrManager);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
