import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void alertExitApp(bool t, dynamic d) {
  Get.defaultDialog(
    title: "alert".tr,
    middleText: "do you want to exit app?".tr,
    actions: [
      ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text("yes".tr)),
      ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("no".tr)),
    ],
  );
}
