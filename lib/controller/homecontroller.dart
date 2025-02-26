import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/homedata.dart';
import 'package:mashwerni/data/datasource/remote/search.dart';
import 'package:mashwerni/data/model/categoriesmodel.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';

abstract class HomeController extends SearchMixController {
  getData();
  goToItems(List<CategoriesModel> categories, int selectedCat);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  late String lang;
  String? email;
  String? phone;
  int? userID;
  HomeData homeData = HomeData(Get.find());
  List<CategoriesModel> categories = [];
  List items = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List categoriesResponse = response['categories'];
        categories
            .addAll(categoriesResponse.map((e) => CategoriesModel.fromJson(e)));
        if (response['items'] is! String) {
          // List itemsResponse = response['items'];
          //   items.addAll(itemsResponse.map((e)=>ItemsModel.fromJson(e)));s
          items.addAll(response['items']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
    userID = myServices.sharedPreferences.getInt("user_id");
    lang = myServices.sharedPreferences.getString("lang")!;
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  goToItems(List<CategoriesModel> categories, int selectedCat) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
    });
  }
}

class SearchMixController extends GetxController {
  SearchData searchData = SearchData(Get.find());
  late TextEditingController search;
  bool isSearch = false;
  List<ItemsModel> searchDataModel = [];
  StatusRequest? statusRequest;

  searchItems() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.search(search.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        searchDataModel.clear();
        List itemsResponse = response['data'];
        searchDataModel
            .addAll(itemsResponse.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
      update();
    }
  }

  onSearch() {
    searchItems();
    isSearch = true;
    update();
  }

  goToPageTripDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.trip, arguments: {
      "itemsModel": itemsModel,
    });
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
}
