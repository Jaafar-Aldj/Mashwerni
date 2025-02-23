import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class ManagerMyTripsData {
  Crud crud;
  ManagerMyTripsData(this.crud);

  getData(int managerID) async {
    var response = await crud
        .postData(AppLink.managerMyTrips, {"manager_id": managerID.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
