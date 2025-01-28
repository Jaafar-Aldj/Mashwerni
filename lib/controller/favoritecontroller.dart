import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/favoritedata.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(int itemID, int val);
  addFavorite(int itemID);
  removeFavorite(int itemID);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};
  // key => items id
  // value => 1(fav) or 0(not_fav)
  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest? statusRequest;
  MyServices myServices = Get.find();

  @override
  setFavorite(int itemID, int val) {
    isFavorite[itemID] = val;
    update();
  }

  @override
  addFavorite(int itemID) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        itemID, myServices.sharedPreferences.getInt('user_id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "notification".tr, message: "done".tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeFavorite(int itemID) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        itemID, myServices.sharedPreferences.getInt('id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "notification".tr, message: "done".tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
