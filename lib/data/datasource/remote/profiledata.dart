import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);

  getData(int userID) async {
    var response = await crud
        .postData(AppLink.profile, {"user_id": userID.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
