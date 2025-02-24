import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/linkapi.dart';

class CustomTripCard extends StatelessWidget {
  final String title;
  final String manager;
  final int daysLeft;
  final String image;
  final void Function()? onTap;
  const CustomTripCard({
    super.key,
    required this.title,
    required this.manager,
    required this.daysLeft,
    required this.image,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(manager),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$daysLeft ${"days left".tr}",
                style: TextStyle(fontSize: 14),
              ),
              Spacer(),
              Icon(Icons.rocket_outlined),
            ],
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imageItems}/$image",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
