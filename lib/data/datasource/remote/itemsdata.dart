import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(int categorID, int userID) async {
    var response = await crud.postData(AppLink.items, {
      "category_id": categorID.toString(),
      "user_id": userID.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  book(int userID, int tripNum) async {
    var response = await crud.postData(AppLink.book, {
      "trip_num": tripNum.toString(),
      "user_id": userID.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  bookingCount(int userID, int tripNum) async {
    var response = await crud.postData(AppLink.bookingCount, {
      "trip_num": tripNum.toString(),
      "user_id": userID.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
