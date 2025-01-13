import 'package:get/get.dart';
import 'package:mashwerni/core/service/services.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? email;
  String? phone;
  int? id;

  initialData() {
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
    id = myServices.sharedPreferences.getInt("id");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
