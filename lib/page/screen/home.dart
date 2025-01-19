import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homecontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/page/widget/customappbar.dart';
import 'package:mashwerni/page/widget/home/customcategorieslist.dart';
import 'package:mashwerni/page/widget/home/customhomecard.dart';
import 'package:mashwerni/page/widget/home/customitemslisthome.dart';
import 'package:mashwerni/page/widget/home/customtitlehome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CustomAppBar(
                titleAppBar: "search for a trip".tr,
                iconOnPressed: () {},
                searchOnPressed: () {},
              ),
              CustomHomeCard(
                title: "summer suprise".tr,
                body: "cashback 20%".tr,
              ),
              CustomTitleHome(title: "categories".tr),
              CustomCategoriesList(),
              CustomTitleHome(title: "trips for you".tr),
              CustomItemsListHome(),
              CustomTitleHome(title: "offers".tr),
              CustomItemsListHome(),
            ],
          ),
        ),
      ),
    );
  }
}
