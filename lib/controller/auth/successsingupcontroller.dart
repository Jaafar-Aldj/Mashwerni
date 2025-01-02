import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';

abstract class SuccessSingUpController extends GetxController {
  goToLogin();
}

class SuccessSingUpControllerImp extends SuccessSingUpController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
