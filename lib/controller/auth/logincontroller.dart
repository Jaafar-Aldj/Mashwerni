import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  transportSignUP();
  transportForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isHidePassword = true;
  StatusRequest? statusRequest;
  LoginData loginData = LoginData(Get.find());
  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print(response);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.home);
        } else {
          Get.defaultDialog(
              title: "warning".tr,
              middleText: "email or password not correct".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
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
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
