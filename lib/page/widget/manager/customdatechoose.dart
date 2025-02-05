import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/manager/addtripcontroller.dart';

class CustomDateChoose extends GetView<AddTripControllerImp> {
  final String text;
  const CustomDateChoose({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.date_range),
      title: Text(
        controller.startDate == null
            ? text
            : controller.startDate!.toLocal().toString().split(' ')[0],
      ),
      trailing: Icon(Icons.calendar_today),
      onTap: () {
        controller.dateChoose(context);
      },
    );
  }
}
