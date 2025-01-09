import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class CheckEmailForgetPasswordData {
  Crud crud;
  CheckEmailForgetPasswordData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmailForgetPassword, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
