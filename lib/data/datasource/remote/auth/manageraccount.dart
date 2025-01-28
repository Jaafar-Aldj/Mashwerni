import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class ManagerAccountData {
  Crud crud;
  ManagerAccountData(this.crud);

  postData({
    required String accountID,
    required String companyName,
    required String companyNameAr,
  }) async {
    var response = await crud.postData(AppLink.managerAccount, {
      "account_id": accountID,
      "company_name": companyName,
      "company_name_ar": companyNameAr,
    });
    return response.fold((l) => l, (r) => r);
  }
}
