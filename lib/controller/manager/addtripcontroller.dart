import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  dateChoose(context);
  costChange(val);
  String formatNumber(String input);
  maxPassengersChange(val);
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
  late TextEditingController cost;
  String rawCostValue = "";
  DateTime? startDate;
  int maxPassengers = 5;
  int tripLong = 1;
  List<Map<String, TextEditingController>> destinations = [
    {
      "english": TextEditingController(),
      "arabic": TextEditingController(),
    }
  ];

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
    cost = TextEditingController();

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
    cost.dispose();
    for (var i = 0; i < destinations.length; i++) {
      destinations[i]['english']!.dispose();
      destinations[i]['arabic']!.dispose();
    }
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
      if (startDate == null) {
        Get.snackbar(
          "error".tr,
          "please select a start date".tr,
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
        cost: rawCostValue,
        maxPassengers: maxPassengers.toString(),
        startDate: startDate.toString(),
        tripLong: tripLong.toString(),
        destinations: destinations,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          controller.changePage(3);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
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

  @override
  dateChoose(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      startDate = pickedDate;
    }
    update();
  }

  @override
  costChange(val) {
    if (val.isNotEmpty) {
      // Remove non-numeric characters (including commas) for backend
      String rawValue = val.replaceAll(RegExp(r'[^0-9]'), '');
      // Format the value for display
      String formatted = formatNumber(rawValue);

      // Set the formatted value to show in the text field (with commas)
      cost.text = formatted;
      cost.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );

      // Update the cost value to the raw numeric value without commas
      rawCostValue = rawValue;
    }
    update();
  }

  @override
  String formatNumber(String input) {
    input = input.replaceAll(RegExp(r'[^0-9]'), '');
    if (input.isEmpty) return "";
    return NumberFormat("#,###", "en_US").format(int.parse(input));
  }

  @override
  maxPassengersChange(val) {
    maxPassengers = val.toInt();
    update();
  }

  void addDestination() {
    if (destinations.length < 5) {
      destinations.add({
        "english": TextEditingController(),
        "arabic": TextEditingController(),
      });
      update();
    } else {
      Get.snackbar("Limit Reached", "You can only add up to 5 destinations.");
    }
  }

  void removeDestination(int index) {
    if (destinations.length > 1) {
      destinations[index]["english"]!.dispose();
      destinations[index]["arabic"]!.dispose();
      destinations.removeAt(index);
      update();
    } else {
      Get.snackbar("Minimum Reached", "You must have at least 1 destination.");
    }
  }
}
