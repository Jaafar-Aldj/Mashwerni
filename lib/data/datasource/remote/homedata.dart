import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData(int userID) async {
    var response =
        await crud.postData(AppLink.home, {"user_id": userID.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
