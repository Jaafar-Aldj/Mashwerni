import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/mytripscontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/data/model/itemsmodel.dart';
import 'package:mashwerni/page/widget/mytrips/customlasttripscard.dart';
import 'package:mashwerni/page/widget/mytrips/customtripcard.dart';

class MyTrips extends StatelessWidget {
  const MyTrips({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTripsControllerImp());
    return Padding(
      padding: const EdgeInsets.all(13),
      child: GetBuilder<MyTripsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              SizedBox(height: 10),
              Text(
                "upcoming trips".tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryText,
                ),
              ),
              SizedBox(height: 10),
              controller.upComingTrips.isEmpty
                  ? Center(child: Text("no upcoming trips".tr))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.upComingTrips.length,
                      itemBuilder: (context, index) {
                        ItemsModel trip = controller.upComingTrips[index];
                        return CustomTripCard(
                          onTap: () {
                            controller.goToTripView(trip);
                          },
                          title: translateDataBase(trip.titleAr, trip.title),
                          manager: translateDataBase(
                              trip.companyNameAr, trip.companyName),
                          daysLeft: trip.daysLeft!,
                          image: trip.images![0],
                        );
                      },
                    ),
              SizedBox(height: 10),
              Text(
                "last trips".tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryText,
                ),
              ),
              SizedBox(height: 10),
              controller.lastTrips.isEmpty
                  ? Center(child: Text("no last trips".tr))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.lastTrips.length,
                      itemBuilder: (context, index) {
                        ItemsModel trip = controller.lastTrips[index];
                        return CustomLastTripCard(
                          onTap: () {
                            controller.goToTripView(trip);
                          },
                          title: translateDataBase(trip.titleAr, trip.title),
                          manager: translateDataBase(
                              trip.companyNameAr, trip.companyName),
                          image: trip.images![0],
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
