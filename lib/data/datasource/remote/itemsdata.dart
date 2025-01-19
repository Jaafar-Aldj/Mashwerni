import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(int id) async {
    var response = await crud.postData(AppLink.items, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
