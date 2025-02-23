import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/tripdetailcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomPriceAndCount extends GetView<TripDetailControllerImp> {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count;

  const CustomPriceAndCount({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onAdd,
              icon: Icon(Icons.add),
            ),
            Container(
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryText)),
              child: Text(
                count,
                style: TextStyle(fontSize: 20, height: 1.3),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: Icon(Icons.remove),
            ),
          ],
        ),
        Spacer(),
        Text(
          "${controller.itemsModel.cost! * controller.count} ${"syp".tr}",
          style: TextStyle(
            color: AppColor.darkPrimary,
            fontSize: 25,
          ),
        )
      ],
    );
  }
}
