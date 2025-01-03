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
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
