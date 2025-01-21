import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(int tripNUM, int userID) async {
    var response = await crud.postData(AppLink.addFav, {
      "trip_num": tripNUM.toString(),
      "user_id": userID.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int tripNUM, int userID) async {
    var response = await crud.postData(AppLink.removeFav, {
      "trip_num": tripNUM.toString(),
      "user_id": userID.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
