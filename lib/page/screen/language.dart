import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/localization/changelocal.dart';
import 'package:mashwerni/page/widget/language/custombutton.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "choose language".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 40,
            ),
            CustomButtonLang(
              textButton: "ar".tr,
              onPressed: () {
                controller.changeLang("ar");
                Get.offNamed(AppRoute.onBoarding);
              },
            ),
            CustomButtonLang(
              textButton: "en".tr,
              onPressed: () {
                controller.changeLang("en");
                Get.offNamed(AppRoute.onBoarding);
              },
            )
          ],
        ),
      ),
    );
  }
}
