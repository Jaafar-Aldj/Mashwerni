import 'package:mashwerni/core/class/crud.dart';
import 'package:mashwerni/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
