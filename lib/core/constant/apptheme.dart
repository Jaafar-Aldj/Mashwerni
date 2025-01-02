import 'package:flutter/material.dart';
import 'package:mashwerni/core/constant/color.dart';

ThemeData themeEn = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.darkPrimary),
  useMaterial3: true,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: AppColor.primaryText,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: AppColor.primaryText,
    ),
    bodyLarge: TextStyle(
      height: 2,
      fontSize: 18,
      color: AppColor.secondryText,
    ),
    bodyMedium: TextStyle(
      height: 2,
      fontSize: 16,
      color: AppColor.secondryText,
    ),
  ),
);
ThemeData themeAr = ThemeData(
  fontFamily: "Cairo",
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.darkPrimary),
  useMaterial3: true,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: AppColor.primaryText,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: AppColor.primaryText,
    ),
    bodyLarge: TextStyle(
      height: 2,
      fontSize: 18,
      color: AppColor.secondryText,
    ),
    bodyMedium: TextStyle(
      height: 2,
      fontSize: 16,
      color: AppColor.secondryText,
    ),
  ),
);
