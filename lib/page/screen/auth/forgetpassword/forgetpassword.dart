import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mashwerni/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/imageasset.dart';
import 'package:mashwerni/core/function/validinput.dart';
import 'package:mashwerni/page/widget/auth/custombutton.dart';
import 'package:mashwerni/page/widget/auth/customtextbody.dart';
import 'package:mashwerni/page/widget/auth/customtextform.dart';
import 'package:mashwerni/page/widget/auth/customtexttitle.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "forget passowrd".tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
                ? Lottie.asset(AppImageAsset.loading)
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          SizedBox(height: 30),
                          CustomTextTitleAuth(title: "check email".tr),
                          SizedBox(height: 10),
                          CustomTextBodyAuth(
                              bodyText:
                                  "please enter your email to receive a verification code"
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
                          CustomButtonAuth(
                            text: "check".tr,
                            onPressed: () {
                              controller.checkEmail();
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
