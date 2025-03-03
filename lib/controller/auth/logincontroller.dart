import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
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
  MyServices myServices = Get.find();

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          if (response['data']['approve'] == 1) {
            myServices.sharedPreferences
                .setString("email", response['data']['email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['phone']);
            myServices.sharedPreferences.setString("step", "3");
            myServices.sharedPreferences
                .setInt("account_id", response['data']['ID']);
            if (response['data']['is_manager'] == 1) {
              if (response['manager'] == 0) {
                Get.toNamed(AppRoute.userOrManager);
              } else {
                myServices.sharedPreferences
                    .setInt("manager_id", response['manager']['ID']);
                Get.offNamed(AppRoute.managerHomeScreen);
              }
            } else {
              if (response['user'] == 0) {
                Get.toNamed(AppRoute.userOrManager);
              } else {
                myServices.sharedPreferences
                    .setInt("user_id", response['user']['ID']);
                Get.offNamed(AppRoute.homeScreen);
              }
            }
          } else {
            Get.toNamed(
              AppRoute.checkEmail,
              arguments: {
                'email': response['data']['email'],
              },
            );
          }
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
