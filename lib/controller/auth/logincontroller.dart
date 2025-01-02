import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';

abstract class LoginController extends GetxController {
  login();
  transportSignUP();
  transportForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController passowrd;
  bool isHidePassword = true;
  @override
  login() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      print("Valid");
    } else {
      print("Not Valid");
    }
  }

  @override
  transportSignUP() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  transportForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  showPassword() {
    isHidePassword = isHidePassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    passowrd = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    passowrd.dispose();
    super.dispose();
  }
}
