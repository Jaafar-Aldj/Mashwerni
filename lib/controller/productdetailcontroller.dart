import 'package:get/get.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';

abstract class ProductDetailController extends GetxController {}

class ProductDetailControllerImp extends ProductDetailController {
  late ItemsModel itemsModel;

  initialData() {
    itemsModel = Get.arguments["itemsModel"];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
