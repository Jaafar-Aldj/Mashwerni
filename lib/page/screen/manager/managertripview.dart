import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/managertripviewcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/page/widget/manager/custommanagerdestination.dart';
import 'package:mashwerni/page/widget/manager/custommanagertopproductdetails.dart';
import 'package:mashwerni/page/widget/tripdetails/custombottomnavproductdetails.dart';

class ManagerTripView extends StatelessWidget {
  const ManagerTripView({super.key});

  @override
  Widget build(BuildContext context) {
    ManagerTripViewControllerImp controller =
        Get.put(ManagerTripViewControllerImp());
    return Scaffold(
      bottomNavigationBar: CustomBottomNavProductDetails(
          title: "view passenger".tr,
          onPressed: () {
            controller.goToTripBooked();
          }),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomManagerTopProductDetails(),
            SizedBox(height: 70),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black.withValues(alpha: (0.1 * 255).toDouble()),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${translateDataBase(controller.itemsModel.titleAr, controller.itemsModel.title)}",
                    style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${translateDataBase(controller.itemsModel.descriptionAr, controller.itemsModel.description)}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "destination".tr,
                    style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  CustomManagerDestination(),
                  SizedBox(height: 20),
                  Text(
                    "${"start date".tr} ${controller.itemsModel.startDate}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${"trip length".tr} ${controller.itemsModel.tripLong} ${"days".tr}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${"category".tr} ${translateDataBase(controller.itemsModel.categoryNameAr, controller.itemsModel.categoryName)}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${"company".tr} ${translateDataBase(controller.itemsModel.companyNameAr, controller.itemsModel.companyName)}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${"start location :".tr} ${translateDataBase(controller.itemsModel.startLocationAr, controller.itemsModel.startLocation)}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${"seats left".tr} ${controller.itemsModel.seatsLeft}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  GetBuilder<ManagerTripViewControllerImp>(
                    builder: (controller) => Text(
                      "${"seats booked".tr} ${controller.count}",
                      style:
                          context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${"price :".tr} ${controller.itemsModel.cost} ${"syp".tr}",
                    style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.darkPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
