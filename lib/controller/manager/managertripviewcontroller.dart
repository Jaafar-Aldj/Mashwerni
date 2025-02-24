import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/manager/manageritems.dart';

abstract class ManagerTripViewController extends GetxController {
  changeImage();
}

class ManagerTripViewControllerImp extends ManagerTripViewController {
  late dynamic itemsModel;
  int count = 0;
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  ManagerItemsData itemsData = ManagerItemsData(Get.find());

  initialData() async {
    itemsModel = Get.arguments["itemsModel"];
    await getCount();
  }

  getCount() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.bookingCount(
      myServices.sharedPreferences.getInt('manager_id')!,
      itemsModel.tripNum!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success && response != null) {
      if (response['status'] == "success") {
        count = response['data'];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  changeImage() {
    update();
  }
}
