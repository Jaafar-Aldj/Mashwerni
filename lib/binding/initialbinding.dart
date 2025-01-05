import 'package:get/get.dart';
import 'package:mashwerni/core/class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
