import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/controller/productdetailcontroller.dart';
import 'package:mashwerni/core/constant/color.dart';
import 'package:mashwerni/linkapi.dart';

class CustomTopProductDetails extends GetView<ProductDetailControllerImp> {
  const CustomTopProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColor.lightPrimary,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
        ),
        Positioned(
          top: 100,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.tripNum}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageItems}/${controller.itemsModel.images![0]}",
              width: 250,
              height: 160,
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}
