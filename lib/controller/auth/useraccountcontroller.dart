import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/auth/useraccount.dart';
import 'package:mashwerni/data/model/categoriesmodel.dart';

abstract class UserAccountController extends GetxController {
  getCategories();
  addAccount();
  changeSelectedDays(int i);
  String durationText();
  bool canSelectMoreCategories();
  bool isSelectionValid();
  selecteOnChange(bool value, CategoriesModel category);
}

class UserAccountControllerImp extends UserAccountController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController firstName;
  late TextEditingController firstNameAr;
  late TextEditingController lastName;
  late TextEditingController lastNameAR;
  late TextEditingController location;
  late TextEditingController locationAr;
  int selectedDays = 1;

  UserAccountData userAccountData = UserAccountData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  List<CategoriesModel> categories = [];
  List<CategoriesModel> get selectedCategories {
    return categories
        .where((category) => category.selected)
        .map((category) => category)
        .toList();
  }

  @override
  void onInit() {
    getCategories();
    firstName = TextEditingController();
    firstNameAr = TextEditingController();
    lastName = TextEditingController();
    lastNameAR = TextEditingController();
    location = TextEditingController();
    locationAr = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    firstNameAr.dispose();
    lastName.dispose();
    lastNameAR.dispose();
    location.dispose();
    locationAr.dispose();
    super.dispose();
  }

  @override
  getCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await userAccountData.getCategories();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        categories.addAll(
          responseData.map((e) => CategoriesModel.fromJson(e)),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  addAccount() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      if (!isSelectionValid()) {
        Get.snackbar(
          "error".tr,
          "please choose one category at least".tr,
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      List selectedCategories1 = selectedCategories.toList();
      List<int?> favoriteList = [];
      for (var i = 0; i < 4; i++) {
        if (selectedCategories1.isEmpty) {
          favoriteList.add(0);
        } else {
          favoriteList.add(selectedCategories1[0].categoryID);
          selectedCategories1.removeAt(0);
        }
      }
      statusRequest = StatusRequest.loading;
      var response = await userAccountData.postData(
        accountID: myServices.sharedPreferences.getInt("account_id").toString(),
        firstName: firstName.text,
        firstNameAr: firstNameAr.text,
        lastName: lastName.text,
        lastNameAr: lastNameAR.text,
        location: location.text,
        locationAr: locationAr.text,
        tripLongFavorite: selectedDays.toString(),
        favorite1: favoriteList[0].toString(),
        favorite2: favoriteList[1].toString(),
        favorite3: favoriteList[2].toString(),
        favorite4: favoriteList[3].toString(),
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successSignUp);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  changeSelectedDays(int i) {
    selectedDays = i + 1;
    update();
  }

  @override
  String durationText() {
    if (selectedDays > 7) {
      return "more than week".tr;
    } else {
      return "$selectedDays ${"day".tr}";
    }
  }

  @override
  bool canSelectMoreCategories() {
    return selectedCategories.length < 4;
  }

  @override
  bool isSelectionValid() {
    return selectedCategories.isNotEmpty;
  }

  @override
  selecteOnChange(bool value, CategoriesModel category) {
    if (value == true && !canSelectMoreCategories()) {
      Get.snackbar(
        "selection limit".tr,
        "you can choose a maximum of 4 categories".tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      category.selected = value;
    }
    update();
  }
}
