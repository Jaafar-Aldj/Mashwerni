import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';

abstract class SingUpController extends GetxController {
  signUp();
  transportLogin();
  showPassword();
}

class SingUpControllerImp extends SingUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  bool isHidePassword = true;
  @override
  signUp() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.offNamed(AppRoute.checkEmail);
    } else {
      print("Not Valid");
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
