import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/homedata.dart';

abstract class HomeController extends GetxController {
  getData();
  goToItems(List categories, int selectedCat);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  late String lang;
  String? email;
  String? phone;
  int? id;
  StatusRequest? statusRequest;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
    id = myServices.sharedPreferences.getInt("id");
    lang = myServices.sharedPreferences.getString("lang")!;
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  goToItems(List categories, int selectedCat) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
    });
  }
}
