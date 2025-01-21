import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/itemsdata.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  changeCat(int catIndex);
  getItems();
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  late int selectedCat;
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];

  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    getItems();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  changeCat(int catIndex) {
    selectedCat = catIndex;
    getItems();
    update();
  }

  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
      categories[selectedCat]['category_id'],
      myServices.sharedPreferences.getInt('id')!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.clear();
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.product, arguments: {
      "itemsModel": itemsModel,
    });
  }
}
