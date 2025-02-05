import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/addtripcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomPassengerSlider extends GetView<AddTripControllerImp> {
  const CustomPassengerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${"passenger number".tr} : ${controller.maxPassengers.toInt()}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: controller.maxPassengers.toDouble(),
          min: 5,
          max: 500,
          divisions: 495,
          inactiveColor: AppColor.lightPrimary,
          activeColor: AppColor.darkPrimary,
          label: "${controller.maxPassengers.toInt()}",
          onChanged: (value) {
            controller.maxPassengersChange(value);
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
