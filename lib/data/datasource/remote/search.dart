import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  search(String search) async {
    var response = await crud.postData(AppLink.searchItems, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
