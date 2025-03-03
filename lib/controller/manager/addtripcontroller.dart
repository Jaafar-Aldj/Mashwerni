import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mashwerni/controller/manager/homescreencontroller.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/manager/addtrip.dart';
import 'package:mashwerni/data/model/categoriesmodel.dart';
import 'package:http/http.dart' as http;

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
  int maxPassengers = 25;
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

  List<File> tripImages = [];
  String serverUrl = "http://10.0.2.2:8000/mashwerni/upload/items";

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
  @override
  addTrip() async {
    var formData = key.currentState;
    if (formData == null || !formData.validate()) {
      return;
    }
    if (tripImages.isEmpty) {
      Get.snackbar("خطأ", "يجب إضافة صورة واحدة على الأقل");
      return;
    }
    if (!isSelectionValid()) {
      Get.snackbar("خطأ", "يرجى اختيار فئة واحدة على الأقل");
      return;
    }
    if (startDate == null) {
      Get.snackbar("خطأ", "يرجى تحديد تاريخ البدء");
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    try {
      List<String> imageNames = await uploadAllImages();

      if (imageNames.isEmpty) {
        Get.snackbar("خطأ", "لم يتم رفع أي صورة، حاول مرة أخرى");
        statusRequest = StatusRequest.failure;
        update();
        return;
      }

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
        images: imageNames, // هنا يتم إرسال جميع الصور كقائمة
      );

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          controller.changePage(3);
          Get.delete<AddTripControllerImp>();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } catch (e) {
      print("خطأ في إرسال الرحلة: $e");
      Get.snackbar("خطأ", "حدث خطأ أثناء رفع الرحلة");
      statusRequest = StatusRequest.failure;
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

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      if (pickedFiles.length + tripImages.length > 5) {
        Get.snackbar("image limit".tr, "you can only pick five images".tr);
        return;
      }

      for (var file in pickedFiles) {
        tripImages.add(File(file.path));
      }
      update();
    }
  }

  Future<String?> uploadImage(File imageFile) async {
    try {
      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String fileName = "${timestamp}_${imageFile.path.split('/').last}";

      var request = http.MultipartRequest("POST", Uri.parse(serverUrl));
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
        filename: fileName,
      ));

      var response = await request.send();
      if (response.statusCode == 200) {
        await response.stream.bytesToString();
        return fileName; // تأكد من إرجاع اسم الملف الذي تم رفعه
      } else {
        print("فشل رفع الصورة: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("خطأ في رفع الصورة: $e");
      return null;
    }
  }

  Future<List<String>> uploadAllImages() async {
    List<String> imageNames = [];

    for (var image in tripImages) {
      String? imageName = await uploadImage(image);
      if (imageName != null) {
        imageNames.add(imageName);
      } else {
        Get.snackbar("خطأ", "تعذر رفع بعض الصور!");
      }
    }

    print("الصور المرفوعة: $imageNames");
    return imageNames;
  }

  void removeImage(int index) {
    tripImages.removeAt(index);
    update();
  }
}
