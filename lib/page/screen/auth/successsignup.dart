import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/auth/successsingupcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/page/widget/auth/custombutton.dart';
import 'package:mashwerni/page/widget/auth/customtextbody.dart';
import 'package:mashwerni/page/widget/auth/customtexttitle.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSingUpControllerImp controller =
        Get.put(SuccessSingUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "success".tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextTitleAuth(title: "congrats".tr),
            CustomTextBodyAuth(bodyText: "successfully registered".tr),
            Spacer(flex: 1),
            Center(
              child: Icon(
                Icons.check_circle_outline_rounded,
                size: 200,
                color: AppColor.primary,
              ),
            ),
            Spacer(flex: 2),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "go to login".tr,
                onPressed: () {
                  controller.goToLogin();
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
