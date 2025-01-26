import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/data/datasource/remote/auth/useraccount.dart';
import 'package:mashwerni/data/model/categoriesmodel.dart';

abstract class UserAccountController extends GetxController {
  getCategories();
  addAccount();
  changeSelectedDays(int i);
  String durationText();
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
  StatusRequest? statusRequest;
  List<CategoriesModel> categories = [];
  List<Map<String, dynamic>> categories1 = [
    {'name': 'ثقافية', 'selected': false},
    {'name': 'مغامرات', 'selected': false},
    {'name': 'استرخاء', 'selected': false},
    {'name': 'تاريخية', 'selected': false},
    {'name': 'طبيعية', 'selected': false},
    {'name': 'رياضية', 'selected': false},
  ];

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
  addAccount() async {
    statusRequest = StatusRequest.loading;
    var response = await userAccountData.postData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
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

  // التحقق من عدد الفئات المختارة
  bool canSelectMoreCategories() {
    return selectedCategories.length < 5;
  }

  List<String> get selectedCategories {
    return categories1
        .where((category) => category['selected'])
        .map((category) => category['name'] as String)
        .toList();
  }

  bool isSelectionValid() {
    return selectedCategories.isNotEmpty;
  }

  selecteOnChange(value, category) {
    if (value == true && !canSelectMoreCategories()) {
      Get.snackbar(
        'حد الاختيار',
        'يمكنك اختيار 5 فئات كحد أقصى.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      category['selected'] = value;
    }
    update();
  }
}
