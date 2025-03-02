import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class ManagerProfileData {
  Crud crud;
  ManagerProfileData(this.crud);

  getData(int managerID) async {
    var response = await crud
        .postData(AppLink.managerProfile, {"manager_id": managerID.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
