import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/page/widget/language/custombutton.dart';

class UserOrManager extends StatelessWidget {
  const UserOrManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "continue as".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 40,
            ),
            CustomButtonLang(
              textButton: "user".tr,
              onPressed: () {
                Get.toNamed(AppRoute.userAccount);
              },
            ),
            CustomButtonLang(
              textButton: "manager".tr,
              onPressed: () {
                Get.toNamed(AppRoute.managerCheck);
              },
            ),
            SizedBox(height: 30),
            Text(
              "as a manager you will need the admin permission to continue".tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
