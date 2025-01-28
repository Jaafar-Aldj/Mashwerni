import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/homescreencontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/page/widget/home/custombuttonappbar.dart';

class ManagerCustomBottomAppBarHome extends StatelessWidget {
  const ManagerCustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagerHomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          children: [
            ...List.generate(
              controller.listPage.length,
              (index) => Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    CustomButtonAppBar(
                      icon: controller.listPage[index]['icon'],
                      textButton: controller.listPage[index]['title'],
                      onPressed: () {
                        controller.changePage(index);
                      },
                      color: controller.currentPage == index
                          ? AppColor.accent
                          : AppColor.darkPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
