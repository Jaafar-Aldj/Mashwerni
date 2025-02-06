import 'package:get/get.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/localization/changelocal.dart';
import 'package:mashwerni/core/service/services.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  LocaleController controller = Get.put(LocaleController());

  @override
  logout() {
    myServices.sharedPreferences.clear();
    controller.changeLang(Get.deviceLocale!.languageCode);
    Get.offAllNamed(AppRoute.login);
  }
}
