import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();
  transportLogin();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  bool isHidePassword = true;
  StatusRequest? statusRequest;
  SignUpData signUpData = SignUpData(Get.find());
  List data = [];

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await signUpData.postData(email.text, password.text, phone.text);
      print(response);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          // data.add(response['data']);
          Get.offNamed(AppRoute.checkEmail, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "warning".tr,
              middleText: "phone number or email already exists".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  transportLogin() {
    Get.offNamed(AppRoute.login);
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
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}
