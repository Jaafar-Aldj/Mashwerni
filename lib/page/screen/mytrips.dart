import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/core/constant/imageasset.dart';
import 'package:mashwerni/page/widget/customappbar.dart';

class MyTrips extends StatelessWidget {
  const MyTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: ListView(
        children: [
          CustomAppBar(titleAppBar: ""),
          SizedBox(height: 10),
          Text(
            "upcoming trips".tr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryText,
            ),
          ),
          SizedBox(height: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: ListTile(
                  title: Text("Trip title"),
                  subtitle: Text("Trip manager"),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "5 days left",
                        style: TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                      Icon(Icons.rocket_outlined),
                    ],
                  ),
                  leading: Image.asset(
                    AppImageAsset.avatar,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Trip title"),
                  subtitle: Text("Trip manager"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Trip title"),
                  subtitle: Text("Trip manager"),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "last trips".tr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryText,
            ),
          ),
          SizedBox(height: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: ListTile(
                  title: Text("Trip title"),
                  subtitle: Text("Trip manager"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(AppImageAsset.avatar),
                      Image.asset(AppImageAsset.avatar),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Trip title"),
                  subtitle: Text("Trip manager"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Trip title"),
                  subtitle: Text("Trip manager"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
