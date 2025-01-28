import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class ManagerCheckData {
  Crud crud;
  ManagerCheckData(this.crud);

  postData(String accountID) async {
    var response = await crud.postData(AppLink.managerCheck, {
      "account_id": accountID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
