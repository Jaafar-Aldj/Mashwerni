import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mashwerni/linkapi.dart';

class CustomLastTripCard extends StatelessWidget {
  final String title;
  final String manager;
  final String image;
  final void Function()? onTap;
  const CustomLastTripCard({
    super.key,
    required this.title,
    required this.manager,
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
          trailing: Icon(Icons.rocket_launch_outlined),
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
