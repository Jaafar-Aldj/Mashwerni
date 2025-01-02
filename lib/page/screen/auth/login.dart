import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/auth/logincontroller.dart';
import 'package:mashwerni/core/function/alertexitapp.dart';
import 'package:mashwerni/core/function/validinput.dart';
import 'package:mashwerni/page/widget/auth/custombutton.dart';
import 'package:mashwerni/page/widget/auth/customtextbody.dart';
import 'package:mashwerni/page/widget/auth/customtextform.dart';
import 'package:mashwerni/page/widget/auth/customtexttitle.dart';
import 'package:mashwerni/page/widget/auth/customtexttransport.dart';
import 'package:mashwerni/page/widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "sign in".tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: PopScope(
        onPopInvokedWithResult: alertExitApp,
        canPop: false,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                LogoAuth(),
                CustomTextTitleAuth(title: "welcome back".tr),
                SizedBox(height: 10),
                CustomTextBodyAuth(
                    bodyText:
                        "sign in your email and password or continue with social media"
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
                GetBuilder<LoginControllerImp>(
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
                    myController: controller.passowrd,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.transportForgetPassword();
                  },
                  child: Text(
                    "forget passowrd".tr,
                    textAlign: TextAlign.end,
                  ),
                ),
                CustomButtonAuth(
                  text: "sign in".tr,
                  onPressed: () {
                    controller.login();
                  },
                ),
                SizedBox(height: 20),
                CustomTextTransportAuth(
                  text: "sign up".tr,
                  question: "don't have an account ?".tr,
                  onPressed: () {
                    controller.transportSignUP();
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
