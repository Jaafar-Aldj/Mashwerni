import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/tripbookedcontroller.dart';
import 'package:mashwerni/core/class/handlingdataview.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';
import 'package:mashwerni/data/model/tripbookedmodel.dart';
import 'package:mashwerni/page/widget/manager/custommanagercardpassengers.dart';

class TripBooked extends StatelessWidget {
  const TripBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("passenger".tr),
      ),
      body: GetBuilder<TripBookedControllerImp>(
        init: TripBookedControllerImp(),
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: controller.tripBookedList.isEmpty
                ? Center(
                    child: Text(
                      "there are no registered passengers for this trip".tr,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: controller.tripBookedList.length,
                    itemBuilder: (context, index) {
                      TripBookedModel passenger =
                          controller.tripBookedList[index];
                      return CustomManagerCardPassengers(
                        fName: translateDataBase(
                            passenger.fNameAr, passenger.fName),
                        lName: translateDataBase(
                            passenger.lNameAr, passenger.lName),
                        location: translateDataBase(
                            passenger.locationAr, passenger.location),
                        phone: passenger.phone!,
                        bookedSeats: passenger.bookedSeats!.toString(),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
