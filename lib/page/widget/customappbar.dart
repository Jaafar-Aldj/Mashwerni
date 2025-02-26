import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? iconOnPressed;
  final void Function()? searchOnPressed;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  const CustomAppBar({
    super.key,
    required this.titleAppBar,
    this.iconOnPressed,
    this.searchOnPressed,
    this.onChanged,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: myController,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: titleAppBar,
                hintStyle: context.textTheme.titleLarge,
                prefixIcon: IconButton(
                  icon: Icon(Icons.search_outlined),
                  onPressed: searchOnPressed,
                ),
                prefixIconColor: AppColor.darkPrimary,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: AppColor.lightPrimary,
              ),
            ),
          ),
          IconButton(
            color: AppColor.primary,
            iconSize: 35,
            icon: Icon(
              Icons.notifications_active_outlined,
              color: AppColor.darkPrimary,
            ),
            onPressed: iconOnPressed,
          ),
        ],
      ),
    );
  }
}
