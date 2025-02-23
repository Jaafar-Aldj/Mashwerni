import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class MyTripsData {
  Crud crud;
  MyTripsData(this.crud);

  getData(int userID) async {
    var response =
        await crud.postData(AppLink.myTrips, {"user_id": userID.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
