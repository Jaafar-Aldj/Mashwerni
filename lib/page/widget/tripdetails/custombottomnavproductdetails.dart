import 'package:flutter/material.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomBottomNavProductDetails extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomBottomNavProductDetails(
      {super.key, required this.onPressed, required this.title});

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
          title,
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
