import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/homecontroller.dart';
import 'package:mashwerni/core/constant/color.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
        body: ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "search for a trip".tr,
                    hintStyle: context.textTheme.titleLarge,
                    prefixIcon: Icon(Icons.search_outlined),
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
              Container(
                child: IconButton(
                  color: AppColor.primary,
                  iconSize: 35,
                  icon: Icon(Icons.notifications_active_outlined),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                    "summer suprise".tr,
                    style: TextStyle(color: AppColor.textAndIcon, fontSize: 20),
                  ),
                  subtitle: Text(
                    "cashback 20%".tr,
                    style: TextStyle(color: AppColor.textAndIcon, fontSize: 25),
                  ),
                ),
              ),
              Positioned(
                right: -20,
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
        ),
      ],
    ));
  }
}
