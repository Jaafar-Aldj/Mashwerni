import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/data/datasource/remote/auth/checkemail.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToSuccessSignUp(String verifyCode);
  resend();
}

class CheckEmailControllerImp extends CheckEmailController {
  StatusRequest? statusRequest;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  late String email;
  @override
  checkEmail() {}

  @override
  goToSuccessSignUp(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkEmailData.postData(email, verifyCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "warning".tr, middleText: "verify code isn't correct".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  resend() {
    checkEmailData.resendData(email);
  }
}
