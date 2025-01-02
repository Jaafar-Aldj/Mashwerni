import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String bodyText;
  const CustomTextBodyAuth({super.key, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        bodyText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
