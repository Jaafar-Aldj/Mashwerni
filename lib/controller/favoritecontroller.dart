import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/data/datasource/remote/favoritedata.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(int itemID, int val);
  addFav(int tripNUM, int userID);
  removeFav(int tripNUM, int userID);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};
  // key => items id
  // value => 1(fav) or 0(not_fav)
  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest? statusRequest;

  @override
  setFavorite(int itemID, int val) {
    isFavorite[itemID] = val;
    update();
  }

  @override
  addFav(int tripNUM, int userID) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(tripNUM, userID);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // data.add(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeFav(int tripNUM, int userID) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(tripNUM, userID);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // data.add(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
