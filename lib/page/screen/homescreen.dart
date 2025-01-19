import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homescreencontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/page/widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.changePage(4);
          },
          backgroundColor:
              controller.currentPage == 4 ? AppColor.accent : AppColor.primary,
          child: Icon(
            Icons.home_outlined,
            color: AppColor.textAndIcon,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBarHome(),
        body: controller.listPage.elementAt(controller.currentPage),
      ),
    );
  }
}
