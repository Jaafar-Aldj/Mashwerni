import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class ManagerItemsData {
  Crud crud;
  ManagerItemsData(this.crud);

  bookingCount(int managerID, int tripNum) async {
    var response = await crud.postData(AppLink.bookingCountManager, {
      "trip_num": tripNum.toString(),
      "manager_id": managerID.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
