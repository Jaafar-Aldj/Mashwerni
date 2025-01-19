import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final IconData icon;
  final String textButton;
  final void Function() onPressed;
  final Color color;
  const CustomButtonAppBar({
    super.key,
    required this.icon,
    required this.textButton,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            textButton,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
