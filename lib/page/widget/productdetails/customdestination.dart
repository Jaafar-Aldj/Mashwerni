import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/productdetailcontroller.dart';

class CustomDestination extends GetView<ProductDetailControllerImp> {
  const CustomDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        controller.itemsModel.destinations!.length,
        (index) => Text(
          "${controller.itemsModel.destinations![index]} ",
          style: context.textTheme.displayMedium,
        ),
      ),
    );
  }
}
