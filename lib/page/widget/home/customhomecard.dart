import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homecontroller.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomHomeCard extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomHomeCard({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.darkPrimary,
            ),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(color: AppColor.textAndIcon, fontSize: 20),
              ),
              subtitle: Text(
                body,
                style: TextStyle(color: AppColor.textAndIcon, fontSize: 25),
              ),
            ),
          ),
          Positioned(
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            top: -20,
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(140),
              ),
            ),
          )
        ],
      ),
    );
  }
}
