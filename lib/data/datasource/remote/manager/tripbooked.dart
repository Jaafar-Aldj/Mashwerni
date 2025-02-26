import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class TripBookedData {
  Crud crud;
  TripBookedData(this.crud);

  getData(int tripNum) async {
    var response = await crud.postData(AppLink.tripBooked, {
      "trip_num": tripNum.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
