import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/auth/useraccountcontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/core/function/validinput.dart';
import 'package:mashwerni/page/widget/auth/customtextbody.dart';
import 'package:mashwerni/page/widget/auth/customtextform.dart';
import 'package:mashwerni/page/widget/auth/customtexttitle.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserAccountControllerImp());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<UserAccountControllerImp>(
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
                      hintText: "enter your first name in english".tr,
                      labelText: "first name".tr,
                      iconData: Icons.mail_outline_rounded,
                      myController: controller.firstName,
                      valid: (val) {
                        return validInput(val!, 3, 20, "name");
                      },
                    ),
                    CustomTextForm(
                      isNumber: false,
                      hintText: "enter your last name in english".tr,
                      labelText: "last name".tr,
                      iconData: Icons.mail_outline_rounded,
                      myController: controller.lastName,
                      valid: (val) {
                        return validInput(val!, 3, 20, "name");
                      },
                    ),
                    CustomTextForm(
                      isNumber: false,
                      hintText: "enter your first name in arabic".tr,
                      labelText: "first name".tr,
                      iconData: Icons.mail_outline_rounded,
                      myController: controller.firstNameAr,
                      valid: (val) {
                        return validInput(val!, 3, 20, "name");
                      },
                    ),
                    CustomTextForm(
                      isNumber: false,
                      hintText: "enter your last name in arabic".tr,
                      labelText: "last name".tr,
                      iconData: Icons.mail_outline_rounded,
                      myController: controller.lastNameAR,
                      valid: (val) {
                        return validInput(val!, 3, 20, "name");
                      },
                    ),
                    CustomTextForm(
                      isNumber: false,
                      hintText: "enter your city name in english".tr,
                      labelText: "location".tr,
                      iconData: Icons.mail_outline_rounded,
                      myController: controller.location,
                      valid: (val) {
                        return validInput(val!, 3, 50, "name");
                      },
                    ),
                    CustomTextForm(
                      isNumber: false,
                      hintText: "enter your city name in arabic".tr,
                      labelText: "location".tr,
                      iconData: Icons.mail_outline_rounded,
                      myController: controller.locationAr,
                      valid: (val) {
                        return validInput(val!, 3, 50, "name");
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      "${"trip duration you prefer".tr} ${controller.durationText()}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 50,
                        diameterRatio: 1.5,
                        perspective: 0.003,
                        physics: FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          controller.changeSelectedDays(index);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) => Center(
                            child: Text(
                              index + 1 > 7
                                  ? "more than week".tr
                                  : "${index + 1} ${"day".tr}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          childCount: 8,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.categories1.length,
                      itemBuilder: (context, index) {
                        var category = controller.categories1[index];
                        return CheckboxListTile(
                          title: Text(category['name'] as String),
                          value: category['selected'],
                          onChanged: (value) {
                            controller.selecteOnChange(value, category);
                          },
                        );
                      },
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (!controller.isSelectionValid()) {
                            Get.snackbar(
                              'خطأ',
                              'يرجى اختيار فئة واحدة على الأقل.',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            return;
                          }
                        },
                        child: Text('تأكيد'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
