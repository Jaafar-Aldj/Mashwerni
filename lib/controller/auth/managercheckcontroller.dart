import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/auth/managercheck.dart';

abstract class ManagerCheckController extends GetxController {
  initialConfirm();
  confirm();
}

class ManagerCheckControllerImp extends ManagerCheckController {
  ManagerCheckData managerCheckData = ManagerCheckData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;

  @override
  void onInit() {
    initialConfirm();
    super.onInit();
  }

  @override
  confirm() async {
    statusRequest = StatusRequest.loading;
    var response = await managerCheckData
        .postData(myServices.sharedPreferences.getInt("account_id").toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (response['data']['is_manager'] == 1) {
          if (response['manager'] == 0) {
            Get.offNamed(AppRoute.managerAccount);
          } else {
            // Get.offAllNamed(Approute.homeManager);
          }
        } else {
          Get.snackbar(
            "error".tr,
            "you haven't been appointed as a manger yet".tr,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialConfirm() async {
    statusRequest = StatusRequest.loading;
    var response = await managerCheckData
        .postData(myServices.sharedPreferences.getInt("account_id").toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (response['data']['is_manager'] == 1) {
          if (response['manager'] == 0) {
            Get.offNamed(AppRoute.managerAccount);
          } else {
            // Get.offAllNamed(Approute.homeManager);
          }
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
