import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  getData(int userID) async {
    var response = await crud
        .postData(AppLink.viewMyFavorite, {"user_id": userID.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int favoriteID) async {
    var response = await crud.postData(
        AppLink.deleteFavorite, {"favorite_id": favoriteID.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
