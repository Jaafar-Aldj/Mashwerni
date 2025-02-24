import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/mytrips.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';

abstract class MyTripsController extends GetxController {
  getData();
  goToTripView(ItemsModel itemModel);
}

class MyTripsControllerImp extends MyTripsController {
  MyTripsData myTripsData = MyTripsData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  List<ItemsModel> upComingTrips = [];
  List<ItemsModel> lastTrips = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await myTripsData
        .getData(myServices.sharedPreferences.getInt('user_id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List upcomingData = response['up_coming_trips'] ?? [];
        upComingTrips.addAll(
          upcomingData.map(
            (e) => ItemsModel.fromJson(e),
          ),
        );
        List lastData = response['last_trips'] ?? [];
        lastTrips.addAll(
          lastData.map(
            (e) => ItemsModel.fromJson(e),
          ),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  goToTripView(ItemsModel itemModel) {
    Get.toNamed(AppRoute.tripView, arguments: {"itemsModel": itemModel});
  }
}
