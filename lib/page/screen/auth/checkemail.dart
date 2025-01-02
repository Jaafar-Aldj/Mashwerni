import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/auth/checkemailcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/page/widget/auth/customtextbody.dart';
import 'package:mashwerni/page/widget/auth/customtexttitle.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "verification code".tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            SizedBox(height: 30),
            CustomTextTitleAuth(title: "check code".tr),
            SizedBox(height: 10),
            CustomTextBodyAuth(
                bodyText:
                    "${"please enter the digit code sent to".tr} test@gmail.com"),
            SizedBox(height: 15),
            OtpTextField(
              numberOfFields: 6,
              enabledBorderColor: AppColor.lightPrimary,
              focusedBorderColor: AppColor.darkPrimary,
              cursorColor: AppColor.primary,
              textStyle: TextStyle(color: AppColor.primaryText, fontSize: 16),
              borderRadius: BorderRadius.circular(12),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verifyCode) {
                controller.goToSuccessSignUp();
              },
            ),
          ],
        ),
      ),
    );
  }
}