import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/auth/manageraccount.dart';

abstract class ManagerAccountController extends GetxController {
  addAccount();
}

class ManagerAccountControllerImp extends ManagerAccountController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController companyName;
  late TextEditingController companyNameAr;

  ManagerAccountData managerAccountData = ManagerAccountData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;

  @override
  void onInit() {
    companyName = TextEditingController();
    companyNameAr = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    companyName.dispose();
    companyNameAr.dispose();
    super.dispose();
  }

  @override
  addAccount() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await managerAccountData.postData(
        accountID: myServices.sharedPreferences.getInt("account_id").toString(),
        companyName: companyName.text,
        companyNameAr: companyNameAr.text,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successSignUp);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
}
