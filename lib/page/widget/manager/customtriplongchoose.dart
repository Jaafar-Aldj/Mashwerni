import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/addtripcontroller.dart';

class ManagerCustomTripLongChoose extends GetView<AddTripControllerImp> {
  const ManagerCustomTripLongChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${"your trip duration is".tr} ${controller.durationText()}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 150,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 50,
            diameterRatio: 1.5,
            perspective: 0.003,
            physics: FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              controller.changeSelectedDays(index);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) => Center(
                child: Text(
                  index + 1 > 7
                      ? "more than week".tr
                      : "${index + 1} ${"day".tr}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              childCount: 8,
            ),
          ),
        ),
      ],
    );
  }
}
