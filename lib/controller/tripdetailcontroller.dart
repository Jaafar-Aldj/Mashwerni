import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/itemsdata.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';

abstract class TripDetailController extends GetxController {
  book();
  add();
  remove();
  changeImage();
}

class TripDetailControllerImp extends TripDetailController {
  late ItemsModel itemsModel;
  int count = 0;
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  ItemsData itemsData = ItemsData(Get.find());

  initialData() {
    itemsModel = Get.arguments["itemsModel"];
  }

  @override
  add() {
    if (count < 5 && count < itemsModel.seatsLeft!.toInt()) {
      count++;
    }
    update();
  }

  @override
  remove() {
    if (count > 0) {
      count--;
    }
    update();
  }

  @override
  book() async {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    for (var i = 0; i < count; i++) {
      statusRequest = StatusRequest.loading;
      response = await itemsData.book(
        myServices.sharedPreferences.getInt('user_id')!,
        itemsModel.tripNum!,
      );
    }
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success && response != null) {
      if (response['status'] == "success") {
        Get.snackbar(
          "notification".tr,
          "done".tr,
          snackPosition: SnackPosition.BOTTOM,
        );
        FirebaseMessaging.instance
            .subscribeToTopic("trip${itemsModel.tripNum}");
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
