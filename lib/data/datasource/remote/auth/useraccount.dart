import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class UserAccountData {
  Crud crud;
  UserAccountData(this.crud);

  postData({
    required String accountID,
    required String firstName,
    required String firstNameAr,
    required String lastName,
    required String lastNameAr,
    required String location,
    required String locationAr,
    required String tripLongFavorite,
    required String favorite1,
    required String favorite2,
    required String favorite3,
    required String favorite4,
  }) async {
    var response = await crud.postData(AppLink.userAccount, {
      "account_id": accountID,
      "f_name": firstName,
      "f_name_ar": firstNameAr,
      "l_name": lastName,
      "l_name_ar": lastNameAr,
      "location": location,
      "location_ar": locationAr,
      "trip_long_favorite": tripLongFavorite,
      "favorite_1": favorite1,
      "favorite_2": favorite2,
      "favorite_3": favorite3,
      "favorite_4": favorite4,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCategories() async {
    var response = await crud.postData(AppLink.categories, {});
    return response.fold((l) => l, (r) => r);
  }
}
