import 'package:get/get.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/handlingdatacontroller.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/data/datasource/remote/profiledata.dart';
import 'package:mashwerni/data/model/userprofilemodel.dart';

class ProfileController extends GetxController {
  ProfileData profileData = ProfileData(Get.find());
  List<UserProfileModel> user = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await profileData.getData(
      myServices.sharedPreferences.getInt('user_id')!,
    );
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        user.addAll(responseData.map((e) => UserProfileModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
