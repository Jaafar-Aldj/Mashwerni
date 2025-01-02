import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
