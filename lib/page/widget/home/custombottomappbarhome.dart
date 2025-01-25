import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homescreencontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/page/widget/home/custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          children: [
            ...List.generate(
              controller.listPage.length - 1,
              (index) => index == 2
                  ? Expanded(
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
                    )
                  : CustomButtonAppBar(
                      icon: controller.listPage[index]['icon'],
                      textButton: controller.listPage[index]['title'],
                      onPressed: () {
                        controller.changePage(index);
                      },
                      color: controller.currentPage == index
                          ? AppColor.accent
                          : AppColor.darkPrimary,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
