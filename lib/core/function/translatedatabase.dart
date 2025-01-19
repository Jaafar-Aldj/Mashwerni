import 'package:get/get.dart';
import 'package:mashwerni/core/service/services.dart';

translateDataBase(columnAr, columnEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
