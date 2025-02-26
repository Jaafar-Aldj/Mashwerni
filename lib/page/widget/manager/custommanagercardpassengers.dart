import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/core/constant/color.dart';

class CustomManagerCardPassengers extends StatelessWidget {
  final String fName;
  final String lName;
  final String location;
  final String phone;
  final String bookedSeats;
  const CustomManagerCardPassengers({
    super.key,
    required this.fName,
    required this.lName,
    required this.location,
    required this.phone,
    required this.bookedSeats,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          "$fName $lName",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${"location".tr} : $location"),
            Text("${"phone".tr} : $phone"),
            Text("${"booked seats".tr} : $bookedSeats"),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.call, color: AppColor.accent),
          onPressed: () {},
        ),
      ),
    );
  }
}
