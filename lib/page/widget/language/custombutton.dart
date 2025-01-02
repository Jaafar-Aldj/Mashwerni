import 'package:flutter/material.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLang(
      {super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.darkPrimary,
        textColor: AppColor.textAndIcon,
        child: Text(
          textButton,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
