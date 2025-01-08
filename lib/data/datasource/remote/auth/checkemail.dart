import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
