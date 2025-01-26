import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class UserAccountData {
  Crud crud;
  UserAccountData(this.crud);

  postData() async {
    var response = await crud.postData(AppLink.userAccount, {});
    return response.fold((l) => l, (r) => r);
  }

  getCategories() async {
    var response = await crud.postData(AppLink.categories, {});
    return response.fold((l) => l, (r) => r);
  }
}
