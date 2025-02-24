import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/tripviewcontroller.dart';
import 'package:mashwerni/core/function/translatedatabase.dart';

class CustomViewDestination extends GetView<TripViewControllerImp> {
  const CustomViewDestination({super.key});

  @override
  Widget build(BuildContext context) {
    var destinationList = translateDataBase(
        controller.itemsModel.destinationsAr,
        controller.itemsModel.destinations);
    return Row(
      children: List.generate(
        destinationList.length,
        (index) => Text(
          "${destinationList[index]} ",
          style: context.textTheme.displayMedium,
        ),
      ),
    );
  }
}
