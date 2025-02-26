import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/data/datasource/remote/manager/tripbooked.dart';
import 'package:mashwerni/data/model/tripbookedmodel.dart';

abstract class TripBookedController extends GetxController {
  getData();
}

class TripBookedControllerImp extends TripBookedController {
  StatusRequest? statusRequest;
  TripBookedData tripBookedData = TripBookedData(Get.find());
  List<TripBookedModel> tripBookedList = [];
  late int tripNum;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await tripBookedData.getData(
      tripNum,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success && response != null) {
      if (response['status'] == "success") {
        List responseData = response['data'] ?? [];
        tripBookedList.addAll(
          responseData.map(
            (e) => TripBookedModel.fromJson(e),
          ),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() async {
    tripNum = Get.arguments['trip_num'];
    await getData();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
