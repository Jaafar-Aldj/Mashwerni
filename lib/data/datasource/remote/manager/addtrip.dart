import 'package:flutter/material.dart';
import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class AddTripData {
  Crud crud;
  AddTripData(this.crud);

  postData(
      {required String managerID,
      required String title,
      required String titleAr,
      required String description,
      required String descriptionAr,
      required String startLocation,
      required String startLocationAr,
      required String categoryID,
      required String startDate,
      required String tripLong,
      required String maxPassengers,
      required String cost,
      required List<Map<String, TextEditingController>> destinations,
      required}) async {
    Map<String, String> destinationData = {};
    for (int i = 0; i < destinations.length; i++) {
      String locationEn = destinations[i]["english"]?.text ?? "";
      String locationAr = destinations[i]["arabic"]?.text ?? "";

      if (locationEn.isNotEmpty) {
        destinationData["location_${i + 1}"] = locationEn;
        destinationData["location_${i + 1}_ar"] = locationAr;
      }
    }
    for (int i = destinationData.length - 1; i < 5; i++) {
      destinationData["location_${i + 1}"] = "";
      destinationData["location_${i + 1}_ar"] = "";
    }

    var response = await crud.postData(AppLink.addTrip, {
      "manager_id": managerID,
      "title": title,
      "title_ar": titleAr,
      "start_date": startDate,
      "trip_long": tripLong,
      "start_location": startLocation,
      "start_location_ar": startLocationAr,
      "description": description,
      "description_ar": descriptionAr,
      "category_id": categoryID,
      "max_passengers": maxPassengers,
      "cost": cost,
      ...destinationData,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCategories() async {
    var response = await crud.postData(AppLink.categories, {});
    return response.fold((l) => l, (r) => r);
  }
}
