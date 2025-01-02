import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/auth/singupcontroller.dart';
import 'package:mashwerni/core/function/alertexitapp.dart';
import 'package:mashwerni/core/function/validinput.dart';
import 'package:mashwerni/page/widget/auth/custombutton.dart';
import 'package:mashwerni/page/widget/auth/customtextbody.dart';
import 'package:mashwerni/page/widget/auth/customtextform.dart';
import 'package:mashwerni/page/widget/auth/customtexttitle.dart';
import 'package:mashwerni/page/widget/auth/customtexttransport.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SingUpControllerImp controller = Get.put(SingUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "sign up".tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: alertExitApp,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                SizedBox(height: 30),
                CustomTextTitleAuth(title: "welcome".tr),
                SizedBox(height: 10),
                CustomTextBodyAuth(
                    bodyText:
                        "sign up your email and password or continue with social media"
                            .tr),
                SizedBox(height: 15),
                CustomTextForm(
                  isNumber: false,
                  hintText: "enter your email".tr,
                  labelText: "email".tr,
                  iconData: Icons.mail_outline_rounded,
                  myController: controller.email,
                  valid: (val) {
                    return validInput(val!, 5, 100, "email");
                  },
                ),
                GetBuilder<SingUpControllerImp>(
                  builder: (controller) => CustomTextForm(
                    hideText: controller.isHidePassword,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    isNumber: false,
                    hintText: "enter your password".tr,
                    labelText: "password".tr,
                    iconData: controller.isHidePassword == false
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    myController: controller.password,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                  ),
                ),
                CustomTextForm(
                  isNumber: true,
                  hintText: "enter your phone number".tr,
                  labelText: "phone".tr,
                  iconData: Icons.phone_outlined,
                  myController: controller.phone,
                  valid: (val) {
                    return validInput(val!, 8, 10, "phone");
                  },
                ),
                CustomButtonAuth(
                  text: "sign up".tr,
                  onPressed: () {
                    controller.signUp();
                  },
                ),
                SizedBox(height: 20),
                CustomTextTransportAuth(
                  text: "sign in".tr,
                  question: "already have an account ?".tr,
                  onPressed: () {
                    controller.transportLogin();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
