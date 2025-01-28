import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/auth/manageraccountcontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/core/function/validinput.dart';
import 'package:mashwerni/page/widget/auth/custombutton.dart';
import 'package:mashwerni/page/widget/auth/customtextbody.dart';
import 'package:mashwerni/page/widget/auth/customtextform.dart';
import 'package:mashwerni/page/widget/auth/customtexttitle.dart';

class ManagerAccount extends StatelessWidget {
  const ManagerAccount({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ManagerAccountControllerImp());
    return Scaffold(
      body: GetBuilder<ManagerAccountControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formState,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  SizedBox(height: 30),
                  CustomTextTitleAuth(title: "create account".tr),
                  SizedBox(height: 10),
                  CustomTextBodyAuth(
                      bodyText: "please enter all the information".tr),
                  SizedBox(height: 15),
                  CustomTextForm(
                    isNumber: false,
                    hintText: "enter your company name in english".tr,
                    labelText: "company name".tr,
                    iconData: Icons.mail_outline_rounded,
                    myController: controller.companyName,
                    valid: (val) {
                      return validInput(val!, 5, 50, "name");
                    },
                  ),
                  CustomTextForm(
                    isNumber: false,
                    hintText: "enter your company name in arabic".tr,
                    labelText: "company name".tr,
                    iconData: Icons.mail_outline_rounded,
                    myController: controller.companyNameAr,
                    valid: (val) {
                      return validInput(val!, 5, 50, "name");
                    },
                  ),
                  SizedBox(height: 20),
                  CustomButtonAuth(
                    text: "confirm".tr,
                    onPressed: () {
                      controller.addAccount();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
