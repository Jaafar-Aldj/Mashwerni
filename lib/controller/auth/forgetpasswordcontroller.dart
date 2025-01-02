import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerfiycode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  @override
  checkEmail() {}

  @override
  goToVerfiycode() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      print("Valid");
      Get.offNamed(AppRoute.verfiyCode);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
