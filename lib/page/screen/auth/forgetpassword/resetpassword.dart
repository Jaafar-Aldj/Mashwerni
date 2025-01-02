import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/auth/resetpasswordcontroller.dart';
import 'package:mashwerni/core/function/validinput.dart';
import 'package:mashwerni/page/widget/auth/custombutton.dart';
import 'package:mashwerni/page/widget/auth/customtextbody.dart';
import 'package:mashwerni/page/widget/auth/customtextform.dart';
import 'package:mashwerni/page/widget/auth/customtexttitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "reset password".tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 30),
              CustomTextTitleAuth(title: "new password".tr),
              SizedBox(height: 10),
              CustomTextBodyAuth(bodyText: "please enter new password".tr),
              SizedBox(height: 15),
              CustomTextForm(
                isNumber: false,
                hintText: "enter your password".tr,
                labelText: "new password".tr,
                iconData: Icons.password_outlined,
                myController: controller.password,
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
              ),
              CustomTextForm(
                isNumber: false,
                hintText: "enter your password again".tr,
                labelText: "confirm password".tr,
                iconData: Icons.password_outlined,
                myController: controller.rePassword,
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
              ),
              CustomButtonAuth(
                text: "save".tr,
                onPressed: () {
                  controller.goToSuccessResetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
