import 'package:flutter/material.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomButtonAuth(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        color: AppColor.primary,
        textColor: AppColor.textAndIcon,
        child: Text(text),
      ),
    );
  }
}
