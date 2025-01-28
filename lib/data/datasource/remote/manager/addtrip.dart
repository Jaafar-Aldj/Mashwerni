import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class AddTripData {
  Crud crud;
  AddTripData(this.crud);

  postData({
    required String managerID,
    required String title,
    required String titleAr,
    required String description,
    required String descriptionAr,
    required String startLocation,
    required String startLocationAr,
    required String categoryID,
  }) async {
    var response = await crud.postData(AppLink.addTrip, {
      "manager_id": managerID,
      "title": title,
      "title_ar": titleAr,
      // "start_date": ,
      // "trip_long": ,
      "start_location": startLocation,
      "start_location_ar": startLocationAr,
      "description": description,
      "description_ar": descriptionAr,
      "category_id": categoryID,
      // "max_passengers": ,
      // "cost": ,
      // "location_1": ,
      // "location_2": ,
      // "location_3": ,
      // "location_4": ,
      // "location_5": ,
      // "location_1_ar": ,
      // "location_2_ar": ,
      // "location_3_ar": ,
      // "location_4_ar": ,
      // "location_5_ar": ,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCategories() async {
    var response = await crud.postData(AppLink.categories, {});
    return response.fold((l) => l, (r) => r);
  }
}
