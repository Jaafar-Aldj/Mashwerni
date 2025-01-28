import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/homescreencontroller.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/manager/addtrip.dart';
import 'package:mashwerni/data/model/categoriesmodel.dart';

abstract class AddTripController extends GetxController {
  addTrip();
  getCategories();
  changeSelectedDays(int i);
  String durationText();
  bool canSelectMoreCategories();
  bool isSelectionValid();
  selecteOnChange(bool value, CategoriesModel category);
}

class AddTripControllerImp extends AddTripController {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  AddTripData addTripData = AddTripData(Get.find());

  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController titleAr;
  late TextEditingController description;
  late TextEditingController descriptionAr;
  late TextEditingController startLocation;
  late TextEditingController startLocationAr;
  int tripLong = 1;

  ManagerHomeScreenControllerImp controller = Get.find();
  List<CategoriesModel> categories = [];
  List<CategoriesModel> get selectedCategory {
    return categories
        .where((category) => category.selected)
        .map((category) => category)
        .toList();
  }

  @override
  void onInit() {
    getCategories();
    title = TextEditingController();
    titleAr = TextEditingController();
    description = TextEditingController();
    descriptionAr = TextEditingController();
    startLocation = TextEditingController();
    startLocationAr = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    titleAr.dispose();
    description.dispose();
    descriptionAr.dispose();
    startLocation.dispose();
    startLocationAr.dispose();
    super.dispose();
  }

  @override
  getCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await addTripData.getCategories();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        categories.addAll(
          responseData.map(
            (e) => CategoriesModel.fromJson(e),
          ),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  addTrip() async {
    var formData = key.currentState;
    if (formData!.validate()) {
      if (!isSelectionValid()) {
        Get.snackbar(
          "error".tr,
          "please choose one category at least".tr,
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      statusRequest = StatusRequest.loading;
      var response = await addTripData.postData(
        managerID: myServices.sharedPreferences.getInt("manager_id").toString(),
        title: title.text,
        titleAr: titleAr.text,
        description: description.text,
        descriptionAr: descriptionAr.text,
        startLocation: startLocation.text,
        startLocationAr: startLocationAr.text,
        categoryID: selectedCategory.first.categoryID.toString(),
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          controller.changePage(3);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  changeSelectedDays(int i) {
    tripLong = i + 1;
    update();
  }

  @override
  String durationText() {
    if (tripLong > 7) {
      return "more than week".tr;
    } else {
      return "$tripLong ${"day".tr}";
    }
  }

  @override
  bool canSelectMoreCategories() {
    return selectedCategory.isEmpty;
  }

  @override
  bool isSelectionValid() {
    return selectedCategory.isNotEmpty;
  }

  @override
  selecteOnChange(bool value, CategoriesModel category) {
    if (value == true && !canSelectMoreCategories()) {
      Get.snackbar(
        "selection limit".tr,
        "you can choose only one category".tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      category.selected = value;
    }
    update();
  }
}
