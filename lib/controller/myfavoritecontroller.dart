import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/myfavoritedata.dart';
import 'package:mashwerni/data/model/myfavoritemodel.dart';

abstract class MyFavoriteController extends GetxController {
  getData();
  deleteFavorite(int favoriteID);
}

class MyFavoriteControllerImp extends MyFavoriteController {
  Map isFavorite = {};
  // key => items id
  // value => 1(fav) or 0(not_fav)
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  StatusRequest? statusRequest;
  MyServices myServices = Get.find();
  List<MyFavoriteModel> data = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData
        .getData(myServices.sharedPreferences.getInt('id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map(
          (e) => MyFavoriteModel.fromJson(e),
        ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteFavorite(int favoriteID) async {
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.deleteData(favoriteID);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.removeWhere((e) => e.favoriteId! == favoriteID);
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
}
