import 'package:flutter/material.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomTextTransportAuth extends StatelessWidget {
  final String text;
  final String question;
  final Function() onPressed;
  const CustomTextTransportAuth(
      {super.key,
      required this.text,
      required this.question,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question),
        SizedBox(width: 5),
        InkWell(
          onTap: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
