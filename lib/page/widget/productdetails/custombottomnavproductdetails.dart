import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomBottomNavProductDetails extends StatelessWidget {
  final void Function()? onPressed;
  const CustomBottomNavProductDetails({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 40,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          "booking".tr,
          style: TextStyle(
            color: AppColor.textAndIcon,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
