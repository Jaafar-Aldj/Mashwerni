import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData(String email, String password, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "email": email,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
