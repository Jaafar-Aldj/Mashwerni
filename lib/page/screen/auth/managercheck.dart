import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/auth/managercheckcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/data/datasource/static/adminnumbers.dart';
import 'package:mashwerni/page/widget/auth/custombutton.dart';
import 'package:mashwerni/page/widget/auth/customtextbody.dart';

class ManagerCheck extends GetView<ManagerCheckControllerImp> {
  const ManagerCheck({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ManagerCheckControllerImp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "please wait".tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CustomTextBodyAuth(
                  bodyText:
                      "please send your email and phone number at one of these numbers"
                          .tr),
              SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  adminNumbers.length,
                  (i) => Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translateDataBase(adminNumbers[i]['name_ar'],
                              adminNumbers[i]['name']),
                          style: TextStyle(
                            color: AppColor.primaryText,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          adminNumbers[i]['number']!,
                          style: TextStyle(
                            color: AppColor.primaryText,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              CustomButtonAuth(
                  text: "confirm".tr,
                  onPressed: () {
                    controller.confirm();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
