import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/homescreencontroller.dart';
import 'package:mashwerni/page/widget/manager/cutombottomappbar.dart';

class ManagerHomeScreen extends StatelessWidget {
  const ManagerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ManagerHomeScreenControllerImp());
    return GetBuilder<ManagerHomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: ManagerCustomBottomAppBarHome(),
        body: controller.listPage[controller.currentPage]['widget'],
      ),
    );
  }
}
