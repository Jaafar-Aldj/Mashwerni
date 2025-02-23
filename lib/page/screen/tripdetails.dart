import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/tripdetailcontroller.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/page/widget/tripdetails/custombottomnavproductdetails.dart';
import 'package:mashwerni/page/widget/tripdetails/customdestination.dart';
import 'package:mashwerni/page/widget/tripdetails/custompriceandcount.dart';
import 'package:mashwerni/page/widget/tripdetails/customtopproductdetails.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TripDetailControllerImp controller = Get.put(TripDetailControllerImp());
    return Scaffold(
      bottomNavigationBar: CustomBottomNavProductDetails(
        onPressed: controller.book,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTopProductDetails(),
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
                    "${translateDataBase(controller.itemsModel.titleAR, controller.itemsModel.title)}",
                    style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  GetBuilder<TripDetailControllerImp>(
                    builder: (controller) => CustomPriceAndCount(
                      onAdd: controller.add,
                      onRemove: controller.remove,
                      count: controller.count.toString(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "${translateDataBase(controller.itemsModel.descriptionAR, controller.itemsModel.description)}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Destination".tr,
                    style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  CustomDestination(),
                  SizedBox(height: 20),

                  // هنا أضفنا باقي التفاصيل
                  Text(
                    "Start Date: ${controller.itemsModel.startDate}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Trip Length: ${controller.itemsModel.tripLong} ${"days".tr}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Category: ${controller.itemsModel.categoryName}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Company: ${controller.itemsModel.companyName}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Location: ${controller.itemsModel.startLocation}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Seats Left: ${controller.itemsModel.seatsLeft}",
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Price: \$${controller.itemsModel.cost}",
                    style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ListView(
      //   children: [
      //     CustomTopProductDetails(),
      //     SizedBox(height: 70),
      //     Container(
      //       padding: EdgeInsets.all(20),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             "${translateDataBase(controller.itemsModel.titleAR, controller.itemsModel.title)}",
      //             style: context.textTheme.displayLarge,
      //           ),
      //           SizedBox(height: 10),
      //           GetBuilder<TripDetailControllerImp>(
      //             builder: (controller) => CustomPriceAndCount(
      //               onAdd: controller.add,
      //               onRemove: controller.remove,
      //               count: controller.count.toString(),
      //             ),
      //           ),
      //           SizedBox(height: 10),
      //           Text(
      //             "${translateDataBase(controller.itemsModel.descriptionAR, controller.itemsModel.description)}",
      //             style: context.textTheme.displayMedium,
      //           ),
      //           SizedBox(height: 10),
      //           Text(
      //             "destination".tr,
      //             style: context.textTheme.displayMedium,
      //           ),
      //           CustomDestination(),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
